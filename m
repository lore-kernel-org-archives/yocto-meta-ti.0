Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19CF7E009A4; Thu, 27 Jul 2017 06:56:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66589E0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 06:56:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RDuBUI016155
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501163771;
	bh=x7RHtjZgtH0lGut+prD0+u7bE5XBJPy7dDyEg38jSOk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=kxTrJUTqGxrro8FaFMzbHyWhJA8eTPYjWFTRNnwPM6qxJFpI8YqKu4AASL9+PPMxG
	tyJ0ZuNVPsFZ7sWin/12dn6R/PCSjIhJsp/aiu00/UyMDPsVVehcSJ3vCGjjhXGuwr
	XUIB1htv/jWPwXbaTYXe6xjedVXRBZlQeAR4tWKE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDuBAn027326
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:56:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 08:56:11 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDuBVf028115;
	Thu, 27 Jul 2017 08:56:11 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <03d24c8c-bbd8-6f2d-b5db-bfdd1128bf90@ti.com>
Date: Thu, 27 Jul 2017 09:56:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH v2 01/37] bcp-lld-rtos: Added RTOS recipe for bcp-lld
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
X-List-Received-Date: Thu, 27 Jul 2017 13:56:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Most of the patches in this set look good except for some 
inconsistencies with COMPAIBLE_MACHINE. In general, it is good to use 
the SOC family when possible (e.g. "k2hk" instead of "k2hk-evm").

- Jake

On 7/18/2017 7:03 PM, Mahesh Radhakrishnan wrote:
> Upstreaming the RTOS recipe for Bit Coprocessor LLD drvier
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
> v2 - Renaming DESCRIPTION to SUMMARY
>
>   recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb | 34 +++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> new file mode 100644
> index 0000000..a2de77c
> --- /dev/null
> +++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "TI Bit Coprocessor (BCP) low level driver "
> +
> +inherit ti-pdk
> +
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
> +PR = "r0"
> +
> +S = "${WORKDIR}/${BCP_LLD_GIT_DESTSUFFIX}"
> +
> +DEPENDS_append = " qmss-lld-rtos \
> +                   cppi-lld-rtos \
> +"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "BCP LLD"
> +


