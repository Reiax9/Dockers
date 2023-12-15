FROM kalilinux/kali-rolling

RUN apt-get update && apt -y install burpsuite gobuster nmap hydra nikto wpscan john whatweb evil-winrm arp-scan metasploit-framework sqlmap \
    kali-desktop-xfce hash-identifier wireshark hashcat tcpdump netcat-traditional crackmapexec xrdp ssh net-tools seclists nano

RUN echo "root:lp" | chpasswd

ENV ROOT_PASSWORD=lp

CMD ["/bin/bash"]