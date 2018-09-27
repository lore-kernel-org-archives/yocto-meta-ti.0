Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D133E00B6C; Thu, 27 Sep 2018 13:00:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC3BCE0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 12:59:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RJxwno062146
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538078398;
	bh=4Rgx7bAZmOE/WYoOCkv8KOUcgjQIULK7EB7Ah7bMfKE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ND+cvjfpgzHFGRGrMOT44ayoGVGaGOcXfSw13spxyFiBqN4MMBaFi1mDsdV7olaJR
	xOyTuivpPnAOEIkyE/EVhcLsF1xw+R/k3+9SSGHNAJlVwYpCgWMTJsiblAtrN4YHWw
	0DmYIAFSFSBwSxWlkXCBrKzX8mQ8XcgZSSPmpvbY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJxw3R022778
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:59:58 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 14:59:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 14:59:57 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJxvVM028615;
	Thu, 27 Sep 2018 14:59:57 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0d6dfe38-bdb1-6fef-463c-8bbdaa899e98@ti.com>
Date: Thu, 27 Sep 2018 15:59:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH 00/30] RTOS patches for Procsdk 5.1 release
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
X-List-Received-Date: Thu, 27 Sep 2018 20:00:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

 From a build perspective, this set appears good. I was able to build 
board-rtos for am335x-evm, am437x-evm, am57xx-evm and am65xx-evm. I 
chose board-rtos as this seems to pull most of the others as dependencies.

- Jake

On 9/27/2018 11:22 AM, Mahesh Radhakrishnan wrote:
> This patch set contains the RTOS recipe udpates required for Processor SDK RTOS 5.1 release.
> Most of them involve SRCREV bumps & adding k3 support to RTOS drivers.
>
> Mahesh Radhakrishnan (30):
>    ti-pdk-bbclass: Checking for doxygen support in the correct manner
>    common-csl-ip: Update to version 03.03.00.12
>    osal: SRCREV update to 01.00.00.12.r1
>    ti-pdk-build: Update to version 01.00.00.10A
>    uart-lld-rtos: Update to version 01.00.00.12
>    board-rtos: Update to version 01.00.10.02 and added support to k3
>    i2c-lld-rtos: Update to version 01.00.00.02 and added support to k3
>    gpio-lld-rtos: Update to version 01.00.00.12 and added support to k3
>    icss-emac-lld: Update to version 01.00.00.13
>    emac-lld-rtos:Update to version 01.00.03.12A and added support to k3
>    starterware: Update to version 02.01.01.08
>    mmcsd-lld-rtos: Update to version 01.00.00.13 and added k3 support
>    mcasp-lld-rtos: Update to 01.00.00.11A
>    fatfs-rtos: Update to version 01.00.00.11 & added k3 support
>    mcbsp-lld-rtos: Update to version 01.00.00.11A
>    pa-lld: Update to version 03.00.02.07
>    pm-lld-rtos: Update to version 01.04.00.05B and k3 support
>    udma-lld-rtos: Added support for udma-lld on rtos  (initial version)
>    spi-lld-rtos: Update to version 01.00.00.12A and added k3 support
>    pcie-lld-rtos: Update to version 02.03.00.01 and added k3 support
>    pruss-lld: pruss-lld-rtos: Update to version 01.00.00.11 and added k3
>      support for rtos
>    sa-lld: sa-lld-rtos: Updated to version 04.00.00.00A, added k3 support
>      and makefile build for k3
>    transport-rtos: nimu-rtos: Updated to version 01.00.00.13 & added k3
>      support
>    sciclient-rtos: SRCREV update
>    usb-lld-rtos: update to versin 01.00.00.15A and added k3 support
>    profiling-rtos: Update to version 01.00.00.07 and added k3 support
>    vps-lld-rtos: Updated to version 01.00.01.13
>    ti-ndk: Upgrading to 3.40.01.01
>    ti-ns: Adding support for TI network services
>    cmb-addon: Update to version 01.01.00.02
>
>   classes/ti-pdk.bbclass                           |  6 +-
>   recipes-bsp/board-rtos/board-rtos_git.bb         | 15 +++--
>   recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb      |  6 +-
>   recipes-bsp/common-csl-ip/common-csl-ip.inc      |  6 +-
>   recipes-bsp/emac-lld/emac-lld-rtos_git.bb        | 11 ++--
>   recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         |  8 +--
>   recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        |  8 +--
>   recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          |  8 +--
>   recipes-bsp/icss-emac-lld/icss-emac-lld.inc      |  2 +-
>   recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      | 15 +++--
>   recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb      |  6 +-
>   recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      |  9 +--
>   recipes-bsp/osal/osal.inc                        |  4 +-
>   recipes-bsp/pa-lld/pa-lld.inc                    |  6 +-
>   recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb        | 13 ++--
>   recipes-bsp/pm-lld/pm-lld-rtos_git.bb            | 20 ++++--
>   recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb      |  1 +
>   recipes-bsp/pruss-lld/pruss-lld.inc              |  6 +-
>   recipes-bsp/sa-lld/sa-lld-rtos_git.bb            | 14 +++-
>   recipes-bsp/sa-lld/sa-lld.inc                    |  6 +-
>   recipes-bsp/sciclient/sciclient-rtos_git.bb      |  6 +-
>   recipes-bsp/spi-lld/spi-lld-rtos_git.bb          | 12 ++--
>   recipes-bsp/starterware/starterware.inc          |  6 +-
>   recipes-bsp/transport-rtos/nimu-rtos_git.bb      |  3 +-
>   recipes-bsp/transport-rtos/transport.inc         |  6 +-
>   recipes-bsp/uart-lld/uart-lld-rtos_git.bb        | 11 ++--
>   recipes-bsp/udma-lld/udma-lld-rtos_git.bb        | 81 ++++++++++++++++++++++++
>   recipes-bsp/usb-lld/usb-lld-rtos_git.bb          |  8 +--
>   recipes-bsp/utils-rtos/profiling-rtos_git.bb     |  8 +--
>   recipes-bsp/vps-lld/vps-lld-rtos_git.bb          |  6 +-
>   recipes-ti/includes/ti-paths.inc                 |  2 +
>   recipes-ti/ndk/ti-ndk_2.26.00.08.bb              | 13 ----
>   recipes-ti/ndk/ti-ndk_3.40.01.01.bb              | 13 ++++
>   recipes-ti/ns/ti-ns.inc                          | 21 ++++++
>   recipes-ti/ns/ti-ns_2.40.01.02.bb                | 14 ++++
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |  6 +-
>   36 files changed, 274 insertions(+), 112 deletions(-)
>   create mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bb
>   delete mode 100644 recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>   create mode 100644 recipes-ti/ndk/ti-ndk_3.40.01.01.bb
>   create mode 100644 recipes-ti/ns/ti-ns.inc
>   create mode 100644 recipes-ti/ns/ti-ns_2.40.01.02.bb
>

