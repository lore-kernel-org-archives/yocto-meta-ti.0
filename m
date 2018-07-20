Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3CA9E01686; Fri, 20 Jul 2018 10:50:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7A99E01687
	for <meta-ti@yoctoproject.org>; Fri, 20 Jul 2018 10:50:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6KHoEQV017534
	for <meta-ti@yoctoproject.org>; Fri, 20 Jul 2018 12:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532109014;
	bh=2zlZTuRSymNeu9i+iEpElxDjy/FQKVWwgCV6M4Ruz08=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=TiHwK7MOimMuqEgJwuB2WSJrD1UQGG/LmCugCi0mYVs63RVAbJDhgdMe9kZ0gbXl2
	aIkwXnSNOvVW/cKitO+d/FhTDcX0LMbkYeCiHGySJGIrHv1QDTK4rw2pYH8UNHqbti
	dcwHPi1xLZxKBS5miQ02D/ywy983+ptX8beljn9I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6KHoESe005035
	for <meta-ti@yoctoproject.org>; Fri, 20 Jul 2018 12:50:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Jul 2018 12:50:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Jul 2018 12:50:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6KHoBI1007031;
	Fri, 20 Jul 2018 12:50:12 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <03f959af-0b77-f488-654a-6a24c0860caa@ti.com>
Date: Fri, 20 Jul 2018 13:50:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH 00/45] SRCREV updates for RTOS recipes
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
X-List-Received-Date: Fri, 20 Jul 2018 17:50:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


Denys,

Can you please apply these to the ti2018.01 branch?


Thank you,

Jake


On 7/19/2018 1:23 PM, Mahesh Radhakrishnan wrote:
> This patchset contains SRCREV updates for Processor SDK RTOS 5.0 release components
>
> Mahesh Radhakrishnan (45):
>    mmap-lld: Update to version 2.0.0.8A & adding rtos recipe
>    aif2-lld: Update to version 1.2.0.2
>    bcp-lld-rtos: Update to version 2.1.0.7
>    board-rtos: Update to version 1.0.10.1
>    cmb-addon-rtos: Update to version 1.1.0.1
>    common-csl-ip: Update to version 3.3.0.11A
>    cppi-lld: Update to version 2.1.0.13
>    dfe-lld: Update to version 1.0.0.9
>    emac-lld-rtos:Update to version 1.0.3.11
>    fatfs-rtos: Update to version 1.0.0.10
>    faultmanagement-rtos: Update to version 1.0.1.4
>    fftc-lld-rtos: Update to version 2.2.0.7
>    gpio-lld-rtos: Update to version 1.0.0.11
>    gpmc-lld-rtos: Update to version 1.0.0.2
>    hyplnk-lld: Update to version 2.1.0.8
>    i2c-lld-rtos: Update to version 1.0.0.11
>    icss-emac-lld: Update to version 1.0.0.12
>    iqn2-lld: Update to version 1.0.0.11
>    mcasp-lld-rtos: Update to version 1.1.0.10
>    mcbsp-lld-rtos: Update to version 1.0.0.10 after adding support for
>      ompal1,makefile based build
>    mmcsd-lld-rtos: Update to version 1.0.0.12
>    nwal-lld: Update to version 2.1.0.12
>    osal: Update to version 1.0.0.11
>    pa-lld: Update to version 3.0.2.6
>    pcie-lld-rtos: Update to version 2.2.0.13
>    pktlib: Update to version 2.1.0.8A
>    pm-lld-rtos: Update to version 1.4.0.5A and 1.8.0.18 (am57xx & dra7xx)
>    pruss-lld: Update to version 1.0.0.10
>    qmss-lld: Update to version 2.1.0.16
>    rm-lld: Update to 2.2.0.3 & recipe update to rtos recipe (html doc
>      link)
>    sa-lld: Update to version 3.0.0.21
>    serdes-diag-rtos: Update to version 1.0.0.11
>    spi-lld-rtos: Update to version 1.0.0.11
>    srio-lld: Update to version 2.0.0.17
>    starterware: Update to version 2.1.1.7
>    tcp3d-lld-rtos: Update to version 2.1.0.6
>    traceframework: Update to version 1.1.1.9
>    transport-rtos: Update to version 1.0.0.12
>    tsip-lld-rtos: Update to version 1.0.0.8
>    uart-lld-rtos: Update to version 1.0.0.11
>    usb-lld-rtos: Update to version 1.0.0.14
>    profiling-rtos: Update to version 1.0.0.6
>    vps-lld-rtos: Update to version 1.0.1.11A
>    wdtimer-rtos: Update to version 1.0.0.4
>    ti-pdk-build-rtos: Update to version 1.0.0.9A
>
>   recipes-bsp/aif2-lld/aif2-lld.inc                       |  6 +++---
>   recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb                 |  6 +++---
>   recipes-bsp/board-rtos/board-rtos_git.bb                |  6 +++---
>   recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb             |  6 +++---
>   recipes-bsp/common-csl-ip/common-csl-ip.inc             |  6 +++---
>   recipes-bsp/cppi-lld/cppi-lld.inc                       |  8 ++++----
>   recipes-bsp/dfe-lld/dfe-lld.inc                         |  6 +++---
>   recipes-bsp/emac-lld/emac-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb                |  6 +++---
>   recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb |  6 +++---
>   recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/hyplnk-lld/hyplnk-lld.inc                   |  6 +++---
>   recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb                 |  6 +++---
>   recipes-bsp/icss-emac-lld/icss-emac-lld.inc             |  6 +++---
>   recipes-bsp/iqn2-lld/iqn2-lld.inc                       |  6 +++---
>   recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb             |  6 +++---
>   recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb             | 13 +++++++++----
>   recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb               | 10 ++++++++++
>   recipes-bsp/mmap-lld/mmap-lld.inc                       |  6 +++---
>   recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb             |  6 +++---
>   recipes-bsp/nwal-lld/nwal-lld.inc                       |  6 +++---
>   recipes-bsp/osal/osal.inc                               |  6 +++---
>   recipes-bsp/pa-lld/pa-lld.inc                           |  6 +++---
>   recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/pktlib/pktlib.inc                           |  8 ++++----
>   recipes-bsp/pm-lld/pm-lld-rtos_git.bb                   | 12 ++++++------
>   recipes-bsp/pruss-lld/pruss-lld.inc                     |  6 +++---
>   recipes-bsp/qmss-lld/qmss-lld.inc                       |  6 +++---
>   recipes-bsp/rm-lld/rm-lld-rtos_git.bb                   |  6 +++++-
>   recipes-bsp/rm-lld/rm-lld.inc                           |  8 ++++----
>   recipes-bsp/sa-lld/sa-lld.inc                           |  6 +++---
>   recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb         |  6 +++---
>   recipes-bsp/spi-lld/spi-lld-rtos_git.bb                 |  6 +++---
>   recipes-bsp/srio-lld/srio-lld.inc                       |  8 ++++----
>   recipes-bsp/starterware/starterware.inc                 |  6 +++---
>   recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb             |  6 +++---
>   recipes-bsp/traceframework/traceframework.inc           |  8 ++++----
>   recipes-bsp/transport-rtos/transport.inc                |  6 +++---
>   recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/uart-lld/uart-lld-rtos_git.bb               |  6 +++---
>   recipes-bsp/usb-lld/usb-lld-rtos_git.bb                 |  6 +++---
>   recipes-bsp/utils-rtos/profiling-rtos_git.bb            |  6 +++---
>   recipes-bsp/vps-lld/vps-lld-rtos_git.bb                 |  6 +++---
>   recipes-bsp/wdtimer/wdtimer-rtos_git.bb                 |  6 +++---
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb        |  6 +++---
>   47 files changed, 164 insertions(+), 145 deletions(-)
>   create mode 100644 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
>


