# FlashBlog

## Summary

- [Description](#description)
- [Dependencies](#dependencies)
- [Help](#help)
- [Troubleshooting](#troubleshooting)
- [Acknowledgments](#acknowledgments)

## Description

Automation template for slide generation model from markdown

## Dependencies

This project depends on:
- pandoc (2.9.2.1)
- GNU make

## Help

  ```shell
    make help # for instructions
  ```

## Troubleshooting

- Pandoc error fetching fonts, connection timeout

    ```shell
    Could not fetch https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap
    HttpExceptionRequest Request {
      host                 = "fonts.googleapis.com"
      port                 = 443
      secure               = True
      requestHeaders       = []
      path                 = "/css2"
      queryString          = "?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap"
      method               = "GET"
      proxy                = Nothing
      rawBody              = False
      redirectCount        = 10
      responseTimeout      = ResponseTimeoutDefault
      requestVersion       = HTTP/1.1
    }
     ConnectionTimeout
    ```
    - Try disabling ipv6
    ```shell
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
    ```
    - [more on ipv6 disabling](https://www.pcsuggest.com/disable-ipv6-linux)

## Acknowledgments
  - 🎩 [@brennop](https://github.com/brennop)
     - The man behind the simplest idea for creating slides, [source](https://brn.wtf/slides), and the inspiration behind this automation project