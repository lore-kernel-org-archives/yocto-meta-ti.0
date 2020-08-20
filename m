Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.111014.1597932005289571476
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 07:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EN1lHlJA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-stiffler@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KDxxLC069986;
	Thu, 20 Aug 2020 08:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597931999;
	bh=K+o3eGTWwjnnqG1qtleoF65iVK4TuOm0TDEeWrccG+4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=EN1lHlJA4KO38z3e6AVpbFa3GvaRqrWj7umgMYbWhgzGIThNRqgZgT3LZPfJfVn60
	 3uyXksipR07aKc1gtg37FsQAZLsvWafrhHTGJRxIwrnHsmPaFUpqQNVP+5VtQsXBQs
	 AP0frwzk8OJRO9W/Oz+OrDdksLqXyLr+hAmZQ2XM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07KDxxXs074244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Aug 2020 08:59:59 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 08:59:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 08:59:59 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KDxwgF055194;
	Thu, 20 Aug 2020 08:59:59 -0500
Subject: Re: [EXTERNAL] [meta-ti] [dunfell/master][PATCH 1/2] ti-rtos-metadata: add recipe to fetch and deploy metadata.inc for RTOS FW binary integration
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
References: <1597895287-29065-1-git-send-email-denis@denix.org>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <c2cc811f-3847-e158-4deb-e2a954e4cb13@ti.com>
Date: Thu, 20 Aug 2020 09:59:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1597895287-29065-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------855AB1FE3C0457B4BE9B4BFF"
Content-Language: en-US

--------------855AB1FE3C0457B4BE9B4BFF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/19/2020 11:48 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 41 ++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> new file mode 100644
> index 0000000..985ff8a
> --- /dev/null
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -0,0 +1,41 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
> +
> +COMPATIBLE_MACHINE = "k3"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +inherit nopackages deploy
> +
> +PLAT_SFX = ""
> +PLAT_SFX_j7 = "/j721e"
> +PLAT_SFX_j7200-evm = "/j7200"
> +PLAT_SFX_am65xx = "/am65xx"
> +
> +# Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
> +TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
> +TI_RTOS_METADATA_PROTOCOL ?= "git"
> +TI_RTOS_METADATA_SRCREV ?= "2290c123a0c4ba4804d794c39532296a9c7b9587"
> +TI_RTOS_METADATA_BRANCH ?= "master"
> +TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
> +TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> +
> +PV = "1.0.0"

Since this may be set to AUTOREV, I would suggest adding SRCPV here. 
This will help track to exact version as well as ensure that the remote 
is checked upon each build and that the commit ID is not just cached.

> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI = "${TI_RTOS_METADATA_URI};branch=${TI_RTOS_METADATA_BRANCH};protocol=${TI_RTOS_METADATA_PROTOCOL}"
> +SRCREV = "${TI_RTOS_METADATA_SRCREV}"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_install[noexec] = "1"
> +
> +do_deploy () {
> +	install -d ${DEPLOYDIR}
> +	install -m 0644 ${TI_RTOS_METADATA_FILE} ${DEPLOYDIR}/
> +}
> +
> +addtask deploy before do_build after do_compile
>
> 

--------------855AB1FE3C0457B4BE9B4BFF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/19/2020 11:48 PM, Denys
      Dmytriyenko wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1597895287-29065-1-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
new file mode 100644
index 0000000..985ff8a
--- /dev/null
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -0,0 +1,41 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9">"file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"</a>
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit nopackages deploy
+
+PLAT_SFX = ""
+PLAT_SFX_j7 = "/j721e"
+PLAT_SFX_j7200-evm = "/j7200"
+PLAT_SFX_am65xx = "/am65xx"
+
+# Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
+TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
+TI_RTOS_METADATA_PROTOCOL ?= "git"
+TI_RTOS_METADATA_SRCREV ?= "2290c123a0c4ba4804d794c39532296a9c7b9587"
+TI_RTOS_METADATA_BRANCH ?= "master"
+TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
+TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
+
+PV = "1.0.0"</pre>
    </blockquote>
    <p>Since this may be set to AUTOREV, I would suggest adding SRCPV
      here. This will help track to exact version as well as ensure that
      the remote is checked upon each build and that the commit ID is
      not just cached.<br>
    </p>
    <blockquote type="cite"
      cite="mid:1597895287-29065-1-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "${TI_RTOS_METADATA_URI};branch=${TI_RTOS_METADATA_BRANCH};protocol=${TI_RTOS_METADATA_PROTOCOL}"
+SRCREV = "${TI_RTOS_METADATA_SRCREV}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${TI_RTOS_METADATA_FILE} ${DEPLOYDIR}/
+}
+
+addtask deploy before do_build after do_compile
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------855AB1FE3C0457B4BE9B4BFF--
