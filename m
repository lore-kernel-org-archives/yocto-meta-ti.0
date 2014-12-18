Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 962E0E00B63; Thu, 18 Dec 2014 10:01:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41E0FE009B3
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 10:01:33 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBII1XHR013545
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 12:01:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBII1WFf015039
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 12:01:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Dec 2014 12:01:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBII1WaF022512;
	Thu, 18 Dec 2014 12:01:32 -0600
Date: Thu, 18 Dec 2014 13:01:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141218180131.GL29971@edge>
References: <1418753531-22371-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1418753531-22371-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] cppi-lld: Add new recipe for CPPI Module low level driver
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
X-List-Received-Date: Thu, 18 Dec 2014 18:01:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 16, 2014 at 01:12:10PM -0500, Sam Nelson wrote:
> - Provides low level driver and test code for Communications port programming
>   interface module
> - Supports k2h, k2k, k2l k2e devices
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/cppi-lld/cppi-lld-test_git.bb |   26 ++++++++++++++++++++++++++
>  recipes-bsp/cppi-lld/cppi-lld.inc         |   15 +++++++++++++++
>  recipes-bsp/cppi-lld/cppi-lld_git.bb      |   19 +++++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100755 recipes-bsp/cppi-lld/cppi-lld-test_git.bb
>  create mode 100644 recipes-bsp/cppi-lld/cppi-lld.inc
>  create mode 100755 recipes-bsp/cppi-lld/cppi-lld_git.bb
> 
> diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
> new file mode 100755
> index 0000000..871546e
> --- /dev/null
> +++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "TI CPPI low level driver unit test and example binaries"

The only cosmetic comment I have is that it would be nice to spell out in the 
recipe description abbreviations like CPPI and QMMS, etc...


> +COMPATIBLE_MACHINE = "keystone"
> +DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld"
> +
> +include cppi-lld.inc
> +
> +CHOICELIST = "yes no"
> +
> +do_compile () {
> +#   Now build the lld in the updated directory
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S}
> +		for choice in ${CHOICELIST}
> +		do
> +			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
> +		done
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +do
> +	make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
> +	done
> +}
> diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
> new file mode 100644
> index 0000000..d26adc5
> --- /dev/null
> +++ b/recipes-bsp/cppi-lld/cppi-lld.inc
> @@ -0,0 +1,15 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git;destsuffix=git/ti/drv/cppi;protocol=git;branch=${BRANCH}"
> +
> +# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.06"
> +SRCREV = "4c6c0a857786c49d8003453d3bc7c3c97ff4f5a4"
> +PV = "02.01.00.06"
> +PR = "r0"
> +
> +DEVICELIST = "k2h k2k k2l k2e"
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/cppi"
> diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
> new file mode 100755
> index 0000000..bb2028b
> --- /dev/null
> +++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "TI CPPI Module low level driver"
> +COMPATIBLE_MACHINE = "keystone"
> +
> +DEPENDS = "common-csl-ip rm-lld qmss-lld"
> +
> +include cppi-lld.inc
> +
> +do_compile () {
> +#   Now build the lld in the updated directory
> +	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}" 
> +	done
> +}
> +
> +do_install () {
> +	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

