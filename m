Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2832.1588794405237918879
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 12:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WSCzu4Ea;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-stiffler@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046JkhIx004489
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 14:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588794403;
	bh=6oBwZ7Bg+kMuIgPdbfL8i05Pt2tK1clYJllwmRYyS6c=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WSCzu4EaYeei36fUWu3jnzq4zbp+yjLHY8twkfrVakilg2K9xzrQpeykaUVPayS0n
	 GJTnlxUcqg7KcFwql8N5RHxzR6aC7v28QYQkxjJ0Q/a/CAPkbhRux5P4cWykUVA9/K
	 wjMJzN9RsF5G24LKnPaT36+eZEAPmQBg31fenMRY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046Jkh1x128687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 14:46:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 14:46:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 14:46:42 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046JkgaV084837;
	Wed, 6 May 2020 14:46:42 -0500
Subject: Re: [EXTERNAL] [meta-ti] [master][PATCH] prueth-fw-am65x-sr2: add prebuilt PRU Ethernet FW for AM65x SR2.0
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
References: <1588792809-18686-1-git-send-email-denis@denix.org>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <5717c18e-c603-1544-60e9-6ae8856cb973@ti.com>
Date: Wed, 6 May 2020 15:46:42 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588792809-18686-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------83EDB9B0C41064A1138D1B7E"
Content-Language: en-US

--------------83EDB9B0C41064A1138D1B7E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Is there a plan to build these from source as with other PRU firmwares?


- Jake

On 5/6/2020 3:20 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 39 ++++++++++++++++++++++++
>   recipes-kernel/linux/linux-ti-staging_5.4.bb     |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> new file mode 100644
> index 0000000..6e17c4a
> --- /dev/null
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +
> +PV = "2.2.0.1+2.2.0.2-rc1"
> +
> +CLEANBROKEN = "1"
> +
> +COMPATIBLE_MACHINE = "am65xx-evm"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
> +BRANCH ?= "ti-linux-firmware"
> +
> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET = " \
> +    am65x-sr2-pru0-prueth-fw.elf \
> +    am65x-sr2-pru1-prueth-fw.elf \
> +    am65x-sr2-rtu0-prueth-fw.elf \
> +    am65x-sr2-rtu1-prueth-fw.elf \
> +    am65x-sr2-txpru0-prueth-fw.elf \
> +    am65x-sr2-txpru1-prueth-fw.elf \
> +"
> +
> +do_install() {
> +	install -d ${D}${base_libdir}/firmware/ti-pruss
> +	for f in ${TARGET}; do
> +		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> +	done
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware"
> +
> +INSANE_SKIP_${PN} = "arch"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 9f893cc..7144a95 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -50,6 +50,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
>   
>   # Add run-time dependency for Cadence MHDP firmware to the rootfs
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
>
> 

--------------83EDB9B0C41064A1138D1B7E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Is there a plan to build these from source as with other PRU
      firmwares?</p>
    <p><br>
    </p>
    <p>- Jake<br>
    </p>
    <div class="moz-cite-prefix">On 5/6/2020 3:20 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1588792809-18686-1-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 39 ++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_5.4.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
new file mode 100644
index 0000000..6e17c4a
--- /dev/null
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76">"file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"</a>
+
+PV = "2.2.0.1+2.2.0.2-rc1"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am65xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
+BRANCH ?= "ti-linux-firmware"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = " \
+    am65x-sr2-pru0-prueth-fw.elf \
+    am65x-sr2-pru1-prueth-fw.elf \
+    am65x-sr2-rtu0-prueth-fw.elf \
+    am65x-sr2-rtu1-prueth-fw.elf \
+    am65x-sr2-txpru0-prueth-fw.elf \
+    am65x-sr2-txpru1-prueth-fw.elf \
+"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
+	done
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 9f893cc..7144a95 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -50,6 +50,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------83EDB9B0C41064A1138D1B7E--
