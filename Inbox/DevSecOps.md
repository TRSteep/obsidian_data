#dev #k8s #docker #security 

**Threat Modeling:** Поможем с формированием требований к процессам, продукту со стороны безопасности, подберем и настроим оптимальный инструмент для моделирования угроз (IriusRisk, OWASP Threat Dragon, Pytm, Materialize threats tool)

**Testing:** Внедрим в пайплан разработки инструменты для тестирования:

- SAST (Static Analysis Tools, OWASP Source Code Analysis Tools, Gerrit, Salus)
- SCA (Dependency Check/Dependency Track, Snyk, Sonatype OSS/Nexus IQ)
- поиск секретов (git-secrets, Gitleaks,TruffleHog)
- DAST (Arachni, OWASP ZAP, Gauntlt)

**Docker build:** Настроим проверку на уязвимости ваших docker-образов (Clair+Klar, Trivy, Docker bench)

**K8s security:** Обеспечим безопасность вашего k8s кластера (kube-bench, kube-hunter, krane, statboard, falco)

**IaC Security:** Опишем вашу инфраструктуру самым безопасным кодом (Checkov, Tfsec, Kubeval)

**Cloud security:** Защитим вашу облачную инфраструктуру (CloudSploit, ScoutSuite)

**Security Chaos Engineering:** Проверим устойчивость вашей системы к сбоям (Kube-monkey, Security Monkey)

**RASP:** Заблокируем атаку в режиме реального времени (openrasp, falco)

**Vulnerability Management:** Предоставим удобный инструмент для менеджмента выявленных уязвимостей (DefectDojo, Archery, Faraday)