# RAILS SMART LIGHTING COAP API

This project is part of my Undergraduate Thesis of the 
Federal Technological University of Paraná (UTFPR - Brasil), from the 
Technology in Internet Systems course.
The objective of this project consists in develop and implement a 
solution for Smart Lighting utilizing concepts and 
technologies of Internet of Things, by making use of a physical circuit 
and a Web Service that talk to each other via Internet, 
making it possible that we retrieve the actual state of a lamp, 
as well as light it or turn ir off.

In this repository, you'll find the API that will receive the requests
and will send it to the circuit. The API was developed using Ruby on Rails.

Este projeto faz parte do meu Trabalho de Conclusão de Curso da 
Universidade Federal Tecnológica do Paraná (UTFPR), do curso de 
Tecnologia em Sistemas para Internet.
O objetivo do projeto consiste em desenvolver e implementar uma solução 
para Smart Lighting utilizando tecnologias e conceitos da IoT, 
fazendo uso de um circuito físico e um Web Service que se 
comuniquem entre si por meio da rede e façam com que seja possível 
obter o estado atual de uma lâmpada, bem como acendê-la ou apagá-la 
remotamente.

Nesse repositório encontra-se a API que ira receber os requests e 
enviar para o circuito. A API foi desenvolvida utilizando o framework 
Ruby on Rails

## Requirements
- Ruby 2.5
- Rails 5.2

## Gems
Apart from the standard Rails gems that come with the application, this project
uses the following gems: 
- [David](https://github.com/nning/david) A CoAP server with Rack Interface
- [Cbor](https://github.com/cabo/cbor-ruby)

## Utilization
After cloning the repository run `bundle install` to install missing gems.

Create some Lamps via `rails c` console.

Start the server with `rails s`. The application will be running on
`coap://[::1]:3000/`

In your terminal, you can use the coap client provided with the
[David](https://github.com/nning/david) gem. To get all lamps for example,
just run: 
- `coap get coap://[::1]:3000/lamps`

To toggle a lamp on or off, just make a put request:
- `coap put coap://[::1]:3000/lamps/<lamp_id>/toggle`

#### Observations
- This is a work in progress project