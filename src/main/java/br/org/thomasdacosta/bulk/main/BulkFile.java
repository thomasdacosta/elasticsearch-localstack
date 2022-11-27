package br.org.thomasdacosta.bulk.main;

import br.org.thomasdacosta.bulk.dto.Client;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;

public class BulkFile {

    public static void main(String[] args) {
        try {
            // Efetuando a leitura do arquivo de bulk
            InputStream inputStream = BulkFile.class.getResourceAsStream("/data_bulk.json");
            String dataBulk = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8)).lines()
                    .collect(Collectors.joining("\n"));

            // Efetuando a leitura do JSON de clientes
            ObjectMapper objectMapper = new ObjectMapper();
            URL url = BulkFile.class.getResource("/data_create.json");
            Client client = objectMapper.readValue(url, Client.class);

            // Criando o arquivo de bulk
            StringBuilder bulk = new StringBuilder();
            for (int i = 0; i <= 1000; i++) {
                String id = String.valueOf((i + 1) * new Random().ints(1, 5000).findAny().getAsInt());
                client.setId(id);
                client.setCompany("ACME COMPANY" + "-" + UUID.randomUUID().toString());
                bulk.append(dataBulk.replace("@id", String.valueOf(id))).append("\r\n");
                bulk.append(objectMapper.writeValueAsString(client)).append("\r\n");
            }

            // Criando o arquivo de bulk
            Path pathDataBulk = Paths.get("./scripts/data_bulk_generated.json");
            Files.writeString(pathDataBulk, bulk.toString(), StandardOpenOption.CREATE,
                    StandardOpenOption.TRUNCATE_EXISTING);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

}
