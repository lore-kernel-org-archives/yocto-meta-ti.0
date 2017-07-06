Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 145BDE00A9B; Thu,  6 Jul 2017 10:02:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D228E00A9B
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 10:02:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66H25QV031918
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 12:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499360525;
	bh=bWR3vpVu5UlqMKSo13v1GtoTropULn/NgxolF9nGShU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ZxTEsNQRxIBA9j95Gqy///ZAqmIu4UpBMp+YuWZ3tJufyuVWEg9uYF7KofmODESy2
	mHZG7Mssm8Rk29OyPdNCFP6lbvW8jaYsfjXBSjZGXViykHHX4koEb6lYMSx+4QZBGo
	slJnyUCEqQiC8EApmZO+cu0s/Rdd2wYVfYitaTgU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66H20Rx018895
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 12:02:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 12:02:00 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66H20ls028973;
	Thu, 6 Jul 2017 12:02:00 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1499358786-35219-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d2f30494-517b-b8b9-950d-b9548e38283b@ti.com>
Date: Thu, 6 Jul 2017 13:02:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499358786-35219-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] bcp-lld-rtos: Added RTOS recipe for bcp-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 17:02:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Is there anything else which will include this *.inc file? Can they be 
combined into a single recipe?


On 7/6/2017 12:33 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb | 10 ++++++++++
>   recipes-bsp/bcp-lld/bcp-lld.inc         | 22 ++++++++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
>   create mode 100644 recipes-bsp/bcp-lld/bcp-lld.inc
>
> diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> new file mode 100644
> index 0000000..dcbc55d
> --- /dev/null
> +++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> @@ -0,0 +1,10 @@
> +inherit ti-pdk
> +require bcp-lld.inc
> +
> +PR = "${INC_PR}.0"
> +
> +DEPENDS_append = " qmss-lld-rtos \
> +                   cppi-lld-rtos \
> +"
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "BCP LLD"
> diff --git a/recipes-bsp/bcp-lld/bcp-lld.inc b/recipes-bsp/bcp-lld/bcp-lld.inc
> new file mode 100644
> index 0000000..ddaf97e
> --- /dev/null
> +++ b/recipes-bsp/bcp-lld/bcp-lld.inc
> @@ -0,0 +1,22 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://bcp.h;beginline=1;endline=40;md5=4f6e6128dd075a89548c0287a39b8896"
> +
> +COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|c667x-evm"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BCP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/bcp-lld.git"
> +BCP_LLD_GIT_PROTOCOL = "git"
> +BCP_LLD_GIT_BRANCH = "master"
> +BCP_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
> +
> +# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.06"
> +BCP_LLD_SRCREV = "44e2ffcb6fd236c41f7ea8f9a1684833f5361daa"
> +
> +BRANCH = "${BCP_LLD_GIT_BRANCH}"
> +SRC_URI = "${BCP_LLD_GIT_URI};destsuffix=${BCP_LLD_GIT_DESTSUFFIX};protocol=${BCP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${BCP_LLD_SRCREV}"
> +PV = "02.01.00.06"
> +INC_PR = "r0"
> +
> +S = "${WORKDIR}/${BCP_LLD_GIT_DESTSUFFIX}"


