Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E89BAE00708; Wed, 19 Sep 2018 09:08:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE99CE00546
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2018 09:08:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JG8Qjd072207
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2018 11:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373306;
	bh=NUyLVydM/I5pJwmbvfFlmZhegZk3f4EXS9Pa2WGN7FY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=s3+c8kVyEVhm4NW86rmBZSe2fX4oi45dNapqqsTiwdm8FDMs9XYSUj9GMv7oVmmtZ
	8n2y0snT9VIq5uPbtQjQddJ9lWJiQqq1a0THc2IqFUg/BZjNwYBlPkjh8/q3tMWtyh
	Q2owni6B/6uKI4VOCGsTOuW4oDG9MOnnIFLg/jjE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JG8QpX008217
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2018 11:08:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:08:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:08:25 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JG8PPt030835;
	Wed, 19 Sep 2018 11:08:25 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>
References: <1536979805-18343-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4c743da5-8a9e-b5d4-c7de-f073c657c91d@ti.com>
Date: Wed, 19 Sep 2018 12:08:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536979805-18343-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko][PATCH] ti-cgt-arm: Update to add rtsv7R4_A_le_v3D16_eabi.lib
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 16:08:28 -0000
Content-Type: multipart/alternative;
	boundary="------------D3E4AD426DA2DA338A8A6AF0"
Content-Language: en-US

--------------D3E4AD426DA2DA338A8A6AF0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/14/2018 10:50 PM, Sam Nelson wrote:
> rtsv7R4_A_le_v3D16_eabi.lib library is not included in the cgt package.
> This library is built dynamically during linking during a single build.
> Bu in case of parallel make, dynamic creation of libraries causes
> failures.
> Hence building and adding the library to the package.
>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>t
> ---
>   recipes-ti/devtools/ti-cgt-arm.inc | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
> index 436fab1..b9f7566 100644
> --- a/recipes-ti/devtools/ti-cgt-arm.inc
> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> @@ -9,12 +9,20 @@ require recipes-ti/includes/ti-paths.inc
>   
>   S = "${WORKDIR}/ti-cgt-arm-${PV}"
>   
> +PR = "r1"
> +
>   SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
>   
>   BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>   TI_BIN_UNPK_ARGS = "--prefix ${S}"
>   TI_BIN_UNPK_CMDS = ""
>   
> +do_compile_append() {
> +    cd ${S}/ti-cgt-arm_${PV}.LTS
> +    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
> +    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
> +}
> +
>   do_install() {
>       install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>       cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}


--------------D3E4AD426DA2DA338A8A6AF0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/14/2018 10:50 PM, Sam Nelson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1536979805-18343-1-git-send-email-sam.nelson@ti.com">
      <pre wrap="">rtsv7R4_A_le_v3D16_eabi.lib library is not included in the cgt package.
This library is built dynamically during linking during a single build.
Bu in case of parallel make, dynamic creation of libraries causes
failures.
Hence building and adding the library to the package.

Signed-off-by: Sam Nelson <a class="moz-txt-link-rfc2396E" href="mailto:sam.nelson@ti.com">&lt;sam.nelson@ti.com&gt;</a>t
---
 recipes-ti/devtools/ti-cgt-arm.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
index 436fab1..b9f7566 100644
--- a/recipes-ti/devtools/ti-cgt-arm.inc
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -9,12 +9,20 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ti-cgt-arm-${PV}"
 
+PR = "r1"
+
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}">"http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"</a>
 
 BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
+do_compile_append() {
+    cd ${S}/ti-cgt-arm_${PV}.LTS
+    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
+    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
+}
+
 do_install() {
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
     cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------D3E4AD426DA2DA338A8A6AF0--
