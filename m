Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4501E00CC4; Tue, 26 Sep 2017 11:31:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60C46E00C3A
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 11:31:44 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QIVil8029430
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 13:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506450704;
	bh=Pt9LWVl/tXldNHwBTlsZ96axeSllJHNZUeD/y4jNqUw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MPTd+ciWF80XeyuZGI2P8Bb+nMhqiofM/2Sl+yq6OZvqcSZ5mPZDrY+lrvjoyHTVW
	ECI9r9Wo/oTpDWjyVAVEmNJpQ2zTKPpQdvESnrTU7HRgnPIXoIGCwthIZBEO0b3l4I
	oVsqS9H7p+t0walgVa5+2TBM2xSbhzx/8hZoif7U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QIViM9014658
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 13:31:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 26 Sep 2017 13:31:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 26 Sep 2017 13:31:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QIVhqi018107;
	Tue, 26 Sep 2017 13:31:44 -0500
Date: Tue, 26 Sep 2017 14:31:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20170926183128.GF26843@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-35-git-send-email-m-radhakrishnan2@ti.com>
	<20170824201144.GO28233@edge>
	<5130E41A1BA9D145BA0F3B18D5CFB0A7437F476E@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F476E@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 35/37] transport-rtos: Added transport recipes(bmet, nimu, nimu-icss) for rtos
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
X-List-Received-Date: Tue, 26 Sep 2017 18:31:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 18, 2017 at 04:40:25PM -0400, Radhakrishnan, Mahesh wrote:
>    Hi Denys,
> 
>    Please see my comments inline.
> 
>    I have submitted a new patch with the fix and an updated commit message
>    (attached)
> 
>     
> 
>    Regards
> 
>    Mahesh
> 
>     
> 
>    -----Original Message-----
>    From: Dmytriyenko, Denys
>    Sent: Thursday, August 24, 2017 4:12 PM
>    To: Radhakrishnan, Mahesh
>    Cc: meta-ti@yoctoproject.org
>    Subject: Re: [meta-ti] [PATCH v2 35/37] transport-rtos: Added transport
>    recipes(bmet, nimu, nimu-icss) for rtos
> 
>     
> 
>    On Tue, Jul 18, 2017 at 07:03:46PM -0400, Mahesh Radhakrishnan wrote:
> 
>    > Upstreaming RTOS driver for Network Interface Management Unit
> 
>    > (NIMU),BMET Ethernet and NIMU ICSS
> 
>    > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> 
>    > ---
> 
>    >
> 
>    > v2 - Added summary
> 
>    >
> 
>    >  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  | 21 +++++++++++++++ 
> 
>    > recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 28
>    +++++++++++++++++++
> 
>    >  recipes-bsp/transport-rtos/nimu-rtos_git.bb      | 34
>    ++++++++++++++++++++++++
> 
>    >  recipes-bsp/transport-rtos/transport.inc         | 17 ++++++++++++
> 
>    >  4 files changed, 100 insertions(+)
> 
>    >  create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> 
>    >  create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> 
>    >  create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bb
> 
>    >  create mode 100644 recipes-bsp/transport-rtos/transport.inc
> 
>    >
> 
>    > diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> 
>    > b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> 
>    > new file mode 100644
> 
>    > index 0000000..775ef3d
> 
>    > --- /dev/null
> 
>    > +++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> 
>    > @@ -0,0 +1,21 @@
> 
>    > +SUMMARY = "RTOS driver for BMET Ethernet"
> 
>    > +
> 
>    > +inherit ti-pdk
> 
>    > +require transport.inc
> 
>    > +
> 
>    > +PR = "${INC_PR}.0"
> 
>    > +
> 
>    > +LIC_FILES_CHKSUM =
>    "file://bmet_transport.h;beginline=12;endline=40;md5=7c7fbe6af03d79b61025a67a8fc96f93"
> 
>    > +
> 
>    > +COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
> 
>    > +
> 
>    > +DEPENDS_append = " qmss-lld-rtos \
> 
>    > +                   cppi-lld-rtos \
> 
>    > +"
> 
>    > +
> 
>    > +BMET_ETH_DESTSUFFIX = "git/bmet_eth"
> 
>    > +
> 
>    > +S = "${WORKDIR}/${BMET_ETH_DESTSUFFIX}"
> 
>    > +
> 
>    > +# HTML doc link params
> 
>    > +PDK_COMP_LINK_TEXT = "Baremetal Ethernet Transport"
> 
>    > diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> 
>    > b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> 
>    > new file mode 100644
> 
>    > index 0000000..3ca196d
> 
>    > --- /dev/null
> 
>    > +++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> 
>    > @@ -0,0 +1,28 @@
> 
>    > +SUMMARY = "RTOS driver for NIMU ICSS"
> 
>    > +
> 
>    > +inherit ti-pdk
> 
>    > +require transport.inc
> 
>    > +
> 
>    > +PR = "${INC_PR}.0"
> 
>    > +
> 
>    > +LIC_FILES_CHKSUM =
>    "file://nimu_icssEth.h;beginline=1;endline=35;md5=fd897e67955a19ba88443d4bc2e7e18a"
> 
>    > +
> 
>    > +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1"
> 
>    > +
> 
>    > +DEPENDS_append = " ti-ndk \
> 
>     
> 
>    Blocked by ti-ndk
> 
>    ti-ndk has been pushed now.

No, I don't think so...


> 
>    > +                   pruss-lld-rtos \
> 
>    > +                   icss-emac-lld-rtos \ "
> 
>    > +
> 
>    > +NIMU_ICSS_DESTSUFFIX = "git/ndk/nimu_icss"
> 
>    > +
> 
>    > +# Build with make instead of XDC
> 
>    > +TI_PDK_XDCMAKE = "0"
> 
>    > +
> 
>    > +S = "${WORKDIR}/${NIMU_ICSS_DESTSUFFIX}"
> 
>    > +
> 
>    > +export PDK_NIMU_ICSS_ROOT_PATH ="${WORKDIR}/build"
> 
>    > +export DEST_ROOT="${S}"
> 
>    > +
> 
>    > +export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
> 
>    > +XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> 
>    > diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> 
>    > b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> 
>    > new file mode 100644
> 
>    > index 0000000..0a415ae
> 
>    > --- /dev/null
> 
>    > +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> 
>    > @@ -0,0 +1,34 @@
> 
>    > +SUMMARY = "RTOS driver for Network Interface Management Unit (NIMU)"
> 
>    > +
> 
>    > +inherit ti-pdk
> 
>    > +require transport.inc
> 
>    > +
> 
>    > +PR = "${INC_PR}.0"
> 
>    > +
> 
>    > +LIC_FILES_CHKSUM =
>    "file://nimu_eth.h;beginline=1;endline=35;md5=52ba99291b03b91058e37115b66edb10"
> 
>    > +
> 
>    > +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
> 
>    > +
> 
>    > +NIMU_DESTSUFFIX = "git/ndk/nimu"
> 
>    > +
> 
>    > +S = "${WORKDIR}/${NIMU_DESTSUFFIX}"
> 
>    > +
> 
>    > +DEPENDS_append = " ti-ndk osal-rtos"
> 
>    > +DEPENDS_append_ti33x = " starterware-rtos emac-lld-rtos"
> 
>    > +DEPENDS_append_ti43x = " starterware-rtos emac-lld-rtos"
> 
>    > +DEPENDS_append_omap-a15 = " emac-lld-rtos"
> 
>    > +DEPENDS_append_dra7xx-evm = " emac-lld-rtos"
> 
>     
> 
>    omap-a15 already covers dra7xx-evm.
> 
>    This has been corrected in the latest patch(V4)
> 
>     
> 
>    > +DEPENDS_append_keystone = " qmss-lld-rtos cppi-lld-rtos"
> 
>    > +DEPENDS_append_k2hk-evm = " pa-lld-rtos"
> 
>    > +DEPENDS_append_k2e-evm = " pa-lld-rtos"
> 
>    > +DEPENDS_append_k2l-evm = " pa-lld-rtos"
> 
>    > +DEPENDS_append_k2g = " emac-lld-rtos"
> 
>    > +
> 
>    > +# Build with make instead of XDC
> 
>    > +TI_PDK_XDCMAKE = "0"
> 
>    > +
> 
>    > +export PDK_NIMU_ROOT_PATH ="${WORKDIR}/build"
> 
>    > +export DEST_ROOT="${S}"
> 
>    > +
> 
>    > +export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
> 
>    > +XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> 
>    > diff --git a/recipes-bsp/transport-rtos/transport.inc
> 
>    > b/recipes-bsp/transport-rtos/transport.inc
> 
>    > new file mode 100644
> 
>    > index 0000000..82427fb
> 
>    > --- /dev/null
> 
>    > +++ b/recipes-bsp/transport-rtos/transport.inc
> 
>    > @@ -0,0 +1,17 @@
> 
>    > +LICENSE = "BSD-3-Clause"
> 
>    > +
> 
>    > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
>    > +
> 
>    > +TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
> 
>    > +TRANSPORT_GIT_PROTOCOL = "git"
> 
>    > +TRANSPORT_GIT_BRANCH = "master"
> 
>    > +
> 
>    > +# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.07A"
> 
>    > +TRANSPORT_SRCREV = "099dbf371cea3b2d883f5c97a4b0e7ef40e84c6a"
> 
>    > +
> 
>    > +BRANCH = "${TRANSPORT_GIT_BRANCH}"
> 
>    > +SRC_URI =
>    "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
> 
>    > +
> 
>    > +SRCREV = "${TRANSPORT_SRCREV}"
> 
>    > +PV = "01.00.00.07A"
> 
>    > +INC_PR = "r0"
> 
>    > --
> 
>    > 1.9.1
> 
>    >
> 
>    > --
> 
>    > _______________________________________________
> 
>    > meta-ti mailing list
> 
>    > meta-ti@yoctoproject.org
> 
>    > https://lists.yoctoproject.org/listinfo/meta-ti

Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE70.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 15:33:37 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 15:33:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 15:33:37 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IKXbZu032387;	Mon, 18 Sep 2017 15:33:37 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] transport-rtos: Added transport recipes(bmet, nimu,
 nimu-icss) for rtos
Thread-Topic: [PATCH v4] transport-rtos: Added transport recipes(bmet, nimu,
 nimu-icss) for rtos
Thread-Index: AQHTML1oBrZV47Lm5Uq/+sGLQIeh7A==
Date: Mon, 18 Sep 2017 16:33:33 -0400
Message-ID: <1505766813-61304-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DLEE108.ent.ti.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
> 
> RTOS driver for Network Interface Management Unit
> (NIMU),BMET Ethernet and NIMU ICSS
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
>  v4 - Updated the commit message
>  v3 - Removed the redundant DEPENDS for dra7xx-evm
>  v2 - Added summary
> 
>  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  | 21 +++++++++++++++
>  recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 28 ++++++++++++++++++++
>  recipes-bsp/transport-rtos/nimu-rtos_git.bb      | 33 ++++++++++++++++++++++++
>  recipes-bsp/transport-rtos/transport.inc         | 17 ++++++++++++
>  4 files changed, 99 insertions(+)
>  create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
>  create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
>  create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bb
>  create mode 100644 recipes-bsp/transport-rtos/transport.inc
> 
> diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> new file mode 100644
> index 0000000..775ef3d
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "RTOS driver for BMET Ethernet"
> +
> +inherit ti-pdk
> +require transport.inc
> +
> +PR = "${INC_PR}.0"
> +
> +LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=7c7fbe6af03d79b61025a67a8fc96f93"
> +
> +COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
> +
> +DEPENDS_append = " qmss-lld-rtos \
> +                   cppi-lld-rtos \
> +"
> +
> +BMET_ETH_DESTSUFFIX = "git/bmet_eth"
> +
> +S = "${WORKDIR}/${BMET_ETH_DESTSUFFIX}"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "Baremetal Ethernet Transport"
> diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> new file mode 100644
> index 0000000..3ca196d
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "RTOS driver for NIMU ICSS"
> +
> +inherit ti-pdk
> +require transport.inc
> +
> +PR = "${INC_PR}.0"
> +
> +LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=fd897e67955a19ba88443d4bc2e7e18a"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1"
> +
> +DEPENDS_append = " ti-ndk \
> +                   pruss-lld-rtos \
> +                   icss-emac-lld-rtos \
> +"
> +
> +NIMU_ICSS_DESTSUFFIX = "git/ndk/nimu_icss"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +S = "${WORKDIR}/${NIMU_ICSS_DESTSUFFIX}"
> +
> +export PDK_NIMU_ICSS_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> +
> +export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
> +XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> new file mode 100644
> index 0000000..5366da7
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "RTOS driver for Network Interface Management Unit (NIMU)"
> +
> +inherit ti-pdk
> +require transport.inc
> +
> +PR = "${INC_PR}.0"
> +
> +LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=52ba99291b03b91058e37115b66edb10"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
> +
> +NIMU_DESTSUFFIX = "git/ndk/nimu"
> +
> +S = "${WORKDIR}/${NIMU_DESTSUFFIX}"
> +
> +DEPENDS_append = " ti-ndk osal-rtos"
> +DEPENDS_append_ti33x = " starterware-rtos emac-lld-rtos"
> +DEPENDS_append_ti43x = " starterware-rtos emac-lld-rtos"
> +DEPENDS_append_omap-a15 = " emac-lld-rtos"
> +DEPENDS_append_keystone = " qmss-lld-rtos cppi-lld-rtos"
> +DEPENDS_append_k2hk-evm = " pa-lld-rtos"
> +DEPENDS_append_k2e-evm = " pa-lld-rtos"
> +DEPENDS_append_k2l-evm = " pa-lld-rtos"
> +DEPENDS_append_k2g = " emac-lld-rtos"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +export PDK_NIMU_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> +
> +export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
> +XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
> new file mode 100644
> index 0000000..82427fb
> --- /dev/null
> +++ b/recipes-bsp/transport-rtos/transport.inc
> @@ -0,0 +1,17 @@
> +LICENSE = "BSD-3-Clause"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
> +TRANSPORT_GIT_PROTOCOL = "git"
> +TRANSPORT_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.07A"
> +TRANSPORT_SRCREV = "099dbf371cea3b2d883f5c97a4b0e7ef40e84c6a"
> +
> +BRANCH = "${TRANSPORT_GIT_BRANCH}"
> +SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${TRANSPORT_SRCREV}"
> +PV = "01.00.00.07A"
> +INC_PR = "r0"
> --
> 1.9.1
> 


