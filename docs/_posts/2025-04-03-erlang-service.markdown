---
layout: default
modal-id: 3
date: 2025-04-03
title: Erlang Service
img: erlang-service.png
gif: erlang-service.png
alt: split image with erlang and aws cloudformation logos
project-date: March - 2025
github-link: https://github.com/igorbpsimoes/erlang-service
---

<div style="text-align: left;">
<p>The service implements a simplified Erlang API for storing/retrieving data in AWS DynamoDB</p>
<p>The repo also contains CloudFormation templates to deploy the whole needed infra in AWS:</p>
<lu style="font-size: 20px;">
  <li>DDB</li>
  <li>Cluster</li>
  <li>Task</li>
  <li>Service</li>
</lu>
<p>The service essentially exposes an API over TCP using serialized Google protocol buffer messages as payload.</p>
