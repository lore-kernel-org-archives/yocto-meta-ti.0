Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E9E4E00718; Wed, 26 Sep 2018 05:22:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8212BE00566
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2018 05:22:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8QCM3pm049494
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2018 07:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537964523;
	bh=/x7mkV560vZFx0dLaoSuAZH4uFOtJXfGgxPKP6Q6Iwg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=rjknNUo/1b+tGYbzq0Nm6UDROVg86Z6OZHocC/xlMWs/DwmGVfp7zG/ibEddrxJGX
	DC9x3juD8YZUO1ySv+YT2LqWqsmt4cmY+N5MQ0iDKx0/8ow1Cwgs5QwqdznTorPaP+
	n2VaMGYHexp559U1y6PtZG8NRaujOVgcgQZCqQQw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QCM3EY031833
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2018 07:22:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 26 Sep 2018 07:22:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 26 Sep 2018 07:22:03 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QCM3ZE003780;
	Wed, 26 Sep 2018 07:22:03 -0500
To: <meta-ti@yoctoproject.org>
References: <1537801175-24942-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3adb07a1-b65b-fac6-c331-2e6c307aac81@ti.com>
Date: Wed, 26 Sep 2018 08:22:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537801175-24942-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH v5 1/3] swtools: common tools for xdc-based component build
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
X-List-Received-Date: Wed, 26 Sep 2018 12:22:05 -0000
Content-Type: multipart/alternative;
	boundary="------------651FFEC17F12A1F1EAA953CB"
Content-Language: en-US

--------------651FFEC17F12A1F1EAA953CB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this set to ti2018.03?


Thank you,

Jake


On 9/24/2018 10:59 AM, Jacob Stiffler wrote:
> From: Jianzhong Xu <xuj@ti.com>
>
> Add SWTOOLS which is needed to build xdc-based processor libs such as
> DSPLIB, MATHLIB, etc from source.
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> Changes from previous version:
> * Removed duplication of shortlog in full commit log
>
>   recipes-ti/includes/ti-paths.inc  |  2 ++
>   recipes-ti/swtools/swtools_git.bb | 44 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
>   create mode 100644 recipes-ti/swtools/swtools_git.bb
>
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> index a401264..f797a2d 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -39,6 +39,7 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
>   export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
>   export SYSBIOS_INSTALL_DIR_RECIPE    = "${installdir}/ti-sysbios-tree"
>   export SYSLINK_INSTALL_DIR_RECIPE    = "${installdir}/ti-syslink-tree"
> +export SWTOOLS_INSTALL_DIR_RECIPE    = "${installdir}/ti-swtools-tree"
>   export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
>   export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
>   export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
> @@ -97,6 +98,7 @@ export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
>   export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>   export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
>   export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> +export SWTOOLS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
>   export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
>   export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
>   export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
> new file mode 100644
> index 0000000..425a069
> --- /dev/null
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "TI Software Tools"
> +HOMEPAGE = "https://git.ti.com/ep-processor-libraries/swtools"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://ti/mas/swtools/copyright.txt;md5=b1f52a1435051fdb18f8885b0384147d"
> +
> +require ../includes/ti-paths.inc
> +
> +DEPENDS = "ti-cgt6x-native \
> +           ti-sysbios \
> +           ti-xdctools-native"
> +
> +PV = "5_0_8"
> +PR = "r0"
> +S = "${WORKDIR}/git"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "881267836907de650edadc56b8e57ab45428021d"
> +
> +export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
> +export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
> +export C66CODEGENTOOL  = "${CGTOOLS_INSTALL_DIR}"
> +
> +PATH_append = ":${XDC_INSTALL_DIR}"
> +
> +XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
> +
> +export XDCPATH
> +
> +do_compile() {
> +	cd ${S}/ti/mas/swtools
> +	xdc
> +}
> +
> +do_install() {
> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +	install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
> +	cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
> +}
> +
> +FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN}-dev = "arch staticdev"
> +ALLOW_EMPTY_${PN} = "1"


--------------651FFEC17F12A1F1EAA953CB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport this set to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/24/2018 10:59 AM, Jacob Stiffler
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537801175-24942-1-git-send-email-j-stiffler@ti.com">
      <pre wrap="">From: Jianzhong Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuj@ti.com">&lt;xuj@ti.com&gt;</a>

Add SWTOOLS which is needed to build xdc-based processor libs such as
DSPLIB, MATHLIB, etc from source.

Signed-off-by: Jianzhong Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuj@ti.com">&lt;xuj@ti.com&gt;</a>
Signed-off-by: Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
Changes from previous version:
* Removed duplication of shortlog in full commit log

 recipes-ti/includes/ti-paths.inc  |  2 ++
 recipes-ti/swtools/swtools_git.bb | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-ti/swtools/swtools_git.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index a401264..f797a2d 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -39,6 +39,7 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
 export SYSBIOS_INSTALL_DIR_RECIPE    = "${installdir}/ti-sysbios-tree"
 export SYSLINK_INSTALL_DIR_RECIPE    = "${installdir}/ti-syslink-tree"
+export SWTOOLS_INSTALL_DIR_RECIPE    = "${installdir}/ti-swtools-tree"
 export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
 export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
 export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
@@ -97,6 +98,7 @@ export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
+export SWTOOLS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
 export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
new file mode 100644
index 0000000..425a069
--- /dev/null
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "TI Software Tools"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://git.ti.com/ep-processor-libraries/swtools">"https://git.ti.com/ep-processor-libraries/swtools"</a>
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://ti/mas/swtools/copyright.txt;md5=b1f52a1435051fdb18f8885b0384147d">"file://ti/mas/swtools/copyright.txt;md5=b1f52a1435051fdb18f8885b0384147d"</a>
+
+require ../includes/ti-paths.inc
+
+DEPENDS = "ti-cgt6x-native \
+           ti-sysbios \
+           ti-xdctools-native"
+
+PV = "5_0_8"
+PR = "r0"
+S = "${WORKDIR}/git"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
+SRCREV = "881267836907de650edadc56b8e57ab45428021d"
+
+export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL  = "${CGTOOLS_INSTALL_DIR}"
+
+PATH_append = ":${XDC_INSTALL_DIR}"
+
+XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+
+export XDCPATH
+
+do_compile() {
+	cd ${S}/ti/mas/swtools
+	xdc
+}
+
+do_install() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+	install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+	cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch staticdev"
+ALLOW_EMPTY_${PN} = "1"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------651FFEC17F12A1F1EAA953CB--
