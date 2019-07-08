Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21F90E00B9C; Mon,  8 Jul 2019 12:47:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CBD8E00951
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2019 12:47:09 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68Jl819029325
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 14:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562615228;
	bh=l2ycHSlAYtcdehDclIJGCgcU9pzy5SU1XYN0ByqJBqo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OFU9YyyNH8GFb5xOWb627DbyhYnC3us3KTavyepF1ockswZKZmhpwY7u8I1r0wAwY
	hxqv4Db4pL6Oqm5QfvMKQka9n0qp7xjtM+OHH3iFLjvW0Obu97PsQJyGQAxth+awQL
	As6tZMyAYZa1TIUAMTBrR2y+j+hqndEcWW63viEI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68Jl8BU047572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 14:47:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 8 Jul 2019 14:47:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 8 Jul 2019 14:47:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68Jl8KU079158;
	Mon, 8 Jul 2019 14:47:08 -0500
Date: Mon, 8 Jul 2019 15:47:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190708194708.GF26050@beryl>
References: <1562611580-75662-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1562611580-75662-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, karthik.ramanan@ti.com
Subject: Re: [ [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse
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
X-List-Received-Date: Mon, 08 Jul 2019 19:47:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> [[meta-ti] [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse

No nested brackets, please.


On Tue, Jul 09, 2019 at 12:16:20AM +0530, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  conf/machine/j7-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index 9a2fada..55d7d61 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -14,6 +14,7 @@ KERNEL_DEVICETREE = " \
>      ti/k3-j721e-dp0.dtbo \
>      ti/k3-j721e-common-proc-board-infotainment.dtbo \
>      ti/k3-j721e-common-proc-board-infotainment-display-sharing.dtbo \
> +    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
>  "
>  
>  UBOOT_MACHINE = "j721e_evm_a72_config"
> -- 
> 1.9.1
> 

