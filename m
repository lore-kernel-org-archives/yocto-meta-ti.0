Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C23E9E00C59; Thu, 14 Feb 2019 09:54:07 -0800 (PST)
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
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75D99E00BB7
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 09:54:05 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1EHs4AU021410
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 11:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550166844;
	bh=TRFl7Up4B8swQhEuSM9Cp/A2TpfUDIsaYtqXKPrw3nY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=y9NtE2syEHVH4AuFa/o/uVmwIIxwt19Um2iRttQv4jZCk/TxP3wPAdSQod2pfykKd
	umO20EZU807HrQecYlp2BbWlXgnUPrCjIuA+szFEU5wlnRQHLaiW78lMjYTF6q3A9k
	qRs5w1+LDKyQdzgECXwxquAJw3PXPS4n38DN0rD4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1EHs4N4022175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 11:54:04 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Feb 2019 11:54:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Feb 2019 11:54:04 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1EHs3GR019507;
	Thu, 14 Feb 2019 11:54:04 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1550163203-38002-1-git-send-email-m-radhakrishnan2@ti.com>
	<1550163203-38002-2-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <5b07c8d6-ad6e-5d89-c130-9cd989581759@ti.com>
Date: Thu, 14 Feb 2019 12:54:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1550163203-38002-2-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH] uart-lld-rtos: Updating checksum file & dependency for ti33x
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
X-List-Received-Date: Thu, 14 Feb 2019 17:54:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


Acked-by: Jacob Stiffler <j-stiffler@ti.com>


On 2/14/2019 11:53 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> index 0dceecb..be1f8c8 100644
> --- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> +++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "TI RTOS low level driver for Universal Asynchronous Receiver/Tran
>   inherit ti-pdk
>   
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://UART.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=94b6a199da1caf777f6756cb70aca4a7"
>   
>   COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -14,19 +14,21 @@ UART_LLD_GIT_PROTOCOL = "git"
>   UART_LLD_GIT_BRANCH = "master"
>   
>   # Below commit ID corresponds to "DEV.UART_LLD.01.00.00.13"
> -UART_LLD_SRCREV = "3af02f4c4e4d5fe126d49076d343f41ea3878106"
> +UART_LLD_SRCREV = "f9298edb5a39bd72f256b53a0b63c6c019cdedce"
>   
>   BRANCH = "${UART_LLD_GIT_BRANCH}"
>   SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${UART_LLD_SRCREV}"
>   PV = "01.00.00.13"
> -PR = "r0"
> +PR = "r1"
>   
>   DEPENDS_append = " edma3-lld-rtos \
>                      osal-rtos \
>   "
> -DEPENDS_append_ti33x = " starterware-rtos"
> +DEPENDS_append_ti33x = " starterware-rtos \
> +                         pruss-lld-rtos \
> +"
>   DEPENDS_append_ti43x = " starterware-rtos"
>   
>   DEPENDS_remove_k3 = "edma3-lld-rtos "
> @@ -43,3 +45,5 @@ XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>   
>   # HTML doc link params
>   PDK_COMP_LINK_TEXT = "UART LLD"
> +
> +INSANE_SKIP_${PN} = "arch"

