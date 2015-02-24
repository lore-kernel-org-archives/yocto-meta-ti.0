Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50B51E00750; Tue, 24 Feb 2015 13:09:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 173E0E00477
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 13:09:46 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1OL9k0i016599
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 15:09:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OL9iD9018297
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 15:09:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Feb 2015 15:09:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OL9iUQ031327;
	Tue, 24 Feb 2015 15:09:44 -0600
Date: Tue, 24 Feb 2015 16:09:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150224210943.GD4338@edge>
References: <1424403355-4377-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424403355-4377-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] netapi: Add recipe for NETAPI module
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
X-List-Received-Date: Tue, 24 Feb 2015 21:09:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any way you can use oe_runmake instead of make and extract common make 
variables to EXTRA_OEMAKE?


On Thu, Feb 19, 2015 at 10:35:55PM -0500, Sam Nelson wrote:
> - Provide TI user space network library and test code
> - Supports k2h, k2k, k2l & k2e devices
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/netapi/netapi-test_git.bb |   48 ++++++++++++++++++++++++++++++++++
>  recipes-ti/netapi/netapi.inc         |   15 +++++++++++
>  recipes-ti/netapi/netapi_git.bb      |   35 +++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 recipes-ti/netapi/netapi-test_git.bb
>  create mode 100644 recipes-ti/netapi/netapi.inc
>  create mode 100644 recipes-ti/netapi/netapi_git.bb
> 
> diff --git a/recipes-ti/netapi/netapi-test_git.bb b/recipes-ti/netapi/netapi-test_git.bb
> new file mode 100644
> index 0000000..4107366
> --- /dev/null
> +++ b/recipes-ti/netapi/netapi-test_git.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "Provides test and application binaries using NETAPI module"
> +COMPATIBLE_MACHINE = "keystone"
> +DEPENDS = "netapi ipsecmgr"
> +
> +include netapi.inc
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/runtime/netapi"
> +
> +do_compile () {
> +#   Build the netapi binaries
> +	for device in ${DEVICELIST}
> +	do
> +		for choice in ${CHOICELIST}
> +		do
> +			oe_runmake tests NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
> +				USEDYNAMIC_LIB="$choice" DEVICE="$device"
> +		done
> +
> +#     Now build the netapi appplications
> +		cd ${S}/applications/ipsec_offload/ipsecmgr/build
> +		make clean app PDK_INSTALL_PATH=${STAGING_INCDIR} NETAPI_SRC_DIR=${S} DEVICE="$device"
> +
> +		cd ${S}/applications/ipsec_offload/config-app/build
> +		make clean app PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device"
> +		cd ${S}
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		oe_runmake installbin INSTALL_INC_BASE_DIR=${D}/${includedir} \
> +			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
> +			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
> +
> +		cd ${S}/applications/ipsec_offload/ipsecmgr/build
> +		make install PDK_INSTALL_PATH=${STAGING_INCDIR} \
> +			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
> +			DEVICE="$device"
> +
> +		cd ${S}/applications/ipsec_offload/config-app/build
> +		make install PDK_INSTALL_PATH=${STAGING_INCDIR} \
> +			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
> +			DEVICE="$device"
> +		cd ${S}
> +	done
> +}
> diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
> new file mode 100644
> index 0000000..4bed670
> --- /dev/null
> +++ b/recipes-ti/netapi/netapi.inc
> @@ -0,0 +1,15 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f2307287ca2074"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
> +
> +# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.04"
> +SRCREV= "dc08af268200908d3d8a456ac852c65c53d2fd12"
> +PV = "01.01.00.04"
> +
> +DEVICELIST = "k2h k2k k2l k2e"
> +
> +CHOICELIST = "yes no"
> +
> +EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> diff --git a/recipes-ti/netapi/netapi_git.bb b/recipes-ti/netapi/netapi_git.bb
> new file mode 100644
> index 0000000..7349c44
> --- /dev/null
> +++ b/recipes-ti/netapi/netapi_git.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "Provides NETAPI module: TI user space network library"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib nwal-lld"
> +
> +NAME = "netapi"
> +
> +include netapi.inc
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/runtime/netapi"
> +
> +do_compile () {
> +#   Now build the netapi
> +	for device in ${DEVICELIST}
> +	do
> +		for choice in ${CHOICELIST}
> +		do
> +			oe_runmake clean NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
> +				USEDYNAMIC_LIB="$choice" DEVICE="$device"
> +			oe_runmake lib NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
> +				USEDYNAMIC_LIB="$choice" DEVICE="$device"
> +		done
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
> +			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
> +			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
> +	done
> +}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

