Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C61F0E013D8; Tue, 26 Jun 2018 09:59:51 -0700 (PDT)
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
X-Greylist: delayed 1259 seconds by postgrey-1.32 at yocto-www;
	Tue, 26 Jun 2018 09:59:51 PDT
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D448E00D13
	for <meta-ti@yoctoproject.org>; Tue, 26 Jun 2018 09:59:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5QGcoiZ065086;
	Tue, 26 Jun 2018 11:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530031130;
	bh=ngCRkiDEY2itxYWdh+iGB0cbPilo+eBPxaCoc3NIVc4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hYVhMUBrS1Jpb4Stt0HzRKrCdQndUNBI6UKlGYQ2IE6pVratk4MwTkywBXfpKxSYH
	2xMEVE3AOtmZ/pv1/WnXb+ereBoBn+akDc0DnuvvaIztdRPEbN34QUsNPaoRxXDat4
	v7io+8NYCplXs7+4LALTaihBStrL3B7smG/yav6Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QGcoUl025089;
	Tue, 26 Jun 2018 11:38:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 26 Jun 2018 11:38:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 26 Jun 2018 11:38:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QGcoeX005847;
	Tue, 26 Jun 2018 11:38:50 -0500
Date: Tue, 26 Jun 2018 12:37:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Asfak Rahman <asfak.rahman@outlook.com>
Message-ID: <20180626163752.GF3163@beryl>
References: <HE1P190MB0233E90101C59E7E782813A9954A0@HE1P190MB0233.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <HE1P190MB0233E90101C59E7E782813A9954A0@HE1P190MB0233.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: How to create multiple uboot images in one recipe
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
X-List-Received-Date: Tue, 26 Jun 2018 16:59:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 25, 2018 at 11:43:11AM +0000, Asfak Rahman wrote:
> Hi,
> 
> 
> I am trying to build multiple uboot images and have them in yocto's deploy directory.
> 
> 
> I have created a .bbappend file and added following lines:
> 
> UBOOT_CONFIG[sd] = "sd_config"
> UBOOT_CONFIG[nand] = "nand_config"
> 
> 
> Now, I can add "UBOOT_CONFIG=sd" or "UBOOT_CONFIG=emmc" to my local.conf.
> 
> This works and I get one uboot image based on the added configuration in local.conf
> 
> 
> I tried to use a script that calls bitbake twice. During the second execution of bitbake, it deletes all files that were built previously.
> 
> Yes, I am using  RM_OLD_IMAGE = "1" to clean old images and I want to keep such setting.
> 
> 
> How to build both of the uboot images(sd and nand) at once?

UBOOT_CONFIG = "sd nand"

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/am335x-hs-evm.conf

-- 
Denys

