Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
 by mx.groups.io with SMTP id smtpd.web08.9343.1621190600280536712
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 16 May 2021 11:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: wunner.de, ip: 83.223.78.240, mailfrom: lukas@wunner.de)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 1835B2800B3C2;
	Sun, 16 May 2021 20:43:17 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id EEBA918D8D; Sun, 16 May 2021 20:43:16 +0200 (CEST)
Message-Id: <ba36a6ad25bf0020cafd8683524c744604270d9c.1621190069.git.lukas@wunner.de>
From: lukas@wunner.de
Date: Sun, 16 May 2021 20:43:16 +0200
Subject: [dunfell PATCH] conf/machine: am64xx: Disable console on ttyS1
To: meta-ti@lists.yoctoproject.org
Cc: Dennis Telatinski <d.telatinski@kunbus.com>, Robert Miracle <r.miracle@kunbus.com>, Andreas Willig <andreas.willig@willig-embedded.de>

The tisdk-default-image built for am64xx-evm invokes agetty on ttyS1,
which fails because the corresponding UART mcu_uart1 is disabled in the
device tree.  systemd respawns agetty every 10 seconds, thereby filling
the log files with error messages and wearing out the SD card:

  systemd[1]: serial-getty@ttyS1.service: Scheduled restart job, restart counter is at 9.
  systemd[1]: Stopped Serial Getty on ttyS1.
  systemd[1]: Started Serial Getty on ttyS1.
  systemd[1]: serial-getty@ttyS1.service: Succeeded.
  agetty[1282]: /dev/ttyS1: not a tty
  systemd[1]: serial-getty@ttyS1.service: Scheduled restart job, restart counter is at 10.

systemd can't tell whether agetty failed transiently or permanently
because its exit code is 1 in either case and diagnostics are only
reported via syslog.

However since mcu_uart1 is disabled by default in both existing am64xx
device trees (k3-am642-evm.dts and k3-am642-sk.dts), configuring it as
console is pointless, so disable it (but retain the one on ttyS2).
If a future device tree enables mcu_uart1 by default, the corresponding
machine config may add ttyS1 to SERIAL_CONSOLES.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 conf/machine/include/am64xx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 641bddd..3d40c4c 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -3,7 +3,7 @@ SOC_FAMILY_append = ":am64xx"
 
 MACHINE_FEATURES += "screen touchscreen"
 
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
+SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
-- 
2.31.1

