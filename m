Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4627CE0074B; Fri, 24 Aug 2018 13:20:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78853E0043F
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 13:20:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OKKU5U081510
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 15:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535142030;
	bh=B8xbop1LnEWHzLJ22aCZkyWVu6xFkb3cVsZIopbG6/Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LKepz1aSix6TajOz7vG1OlpqJbLylw57qGrA+JXi5sn5MsqFlpY3SS3V44hYIu+gQ
	3yx2mq3TOT2c3Gid/zf/2WSEMrxB+FCn5zj9vaXgFU6uCNZcaz9IpNT/LRQBS0V6Fz
	vYPFqlb7BzZbPLsilR4p7OiJYhwHoQdNkgaKUkog=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OKKU61028591
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 15:20:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 15:20:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 15:20:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OKKURd029729;
	Fri, 24 Aug 2018 15:20:30 -0500
Date: Fri, 24 Aug 2018 16:19:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180824201936.GB9228@beryl>
References: <1535048889-3938-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1535048889-3938-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko][PATCH v4 4/4] sciclient: Add recipe for SCI client driver
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
X-List-Received-Date: Fri, 24 Aug 2018 20:20:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 23, 2018 at 02:28:09PM -0400, Sam Nelson wrote:
> Sci client provides API to communicate with the core running System
> firmware
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous version of patch
> - Remove redundant description
> - remove redudant defines

Sam,

Can you please make these 2 changes as a separate patch? I wanted to start 
testing all the other updates right away and didn't wait for your v4, but 
instead went with v3, as the changes are rather cosmetical. Thanks.


> ---
> ---
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 83 +++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb
> 
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> new file mode 100644
> index 0000000..e059f4b
> --- /dev/null
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -0,0 +1,83 @@
> +SUMMARY = "TI RTOS low level driver for SCICLIENT"
> +
> +inherit ti-pdk
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> +
> +COMPATIBLE_MACHINE = "k3"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
> +SCICLIENT_GIT_PROTOCOL = "git"
> +SCICLIENT_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
> +SCICLIENT_SRCREV = "4ac052a70764c5fcf9dd18d521fe3b631bfcd875"
> +
> +BRANCH = "${SCICLIENT_GIT_BRANCH}"
> +SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${SCICLIENT_SRCREV}"
> +PV = "01.00.00.00"
> +PR = "r0"
> +
> +DEPENDS_append = " osal-rtos common-csl-ip-rtos"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +SCICLIENT_PACKAGE_BASE   = "${S}/../sciclient_base"
> +SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/sciclient"
> +
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
> +
> +#export PDK_SCICLIENT_ROOT_PATH ="${WORKDIR}/build"
> +#export DEST_ROOT="${S}"
> +
> +LIMSOCS_am65xx-evm = "am65xx"
> +LIMBOARDS_am65xx-evm = "am65xx_evm"
> +BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "SCICLIENT"
> +
> +do_configure() {
> +
> +    rm -rf ${SCICLIENT_PACKAGE_BASE}
> +    cd ${S}
> +
> +    # remove any previous package
> +    rm -f ${SCICLIENT_PACKAGE_BASE}
> +
> +    # make the release package before building it
> +    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${SCICLIENT_PACKAGE_BASE} PDK_SCICLIENT_COMP_PATH=${S}
> +
> +   # This is to ensure the make package completed successfully
> +    cat  ${SCICLIENT_ROOTPATH}/makefile
> +}
> +
> +do_compile() {
> +
> +    cd ${SCICLIENT_ROOTPATH}
> +
> +    # Clean
> +    # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> +
> +    # Build am65xx libraries
> +    make lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> +
> +    #archive
> +    tar -cf sciclient.tar --exclude='*.tar' ./*
> +}
> +
> +do_install() {
> +    cd ${SCICLIENT_ROOTPATH}
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

