Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17472E0132C; Fri, 13 Jul 2018 18:16:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04E42E006B4
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 18:16:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6E1GE0R040487
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 20:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531530974;
	bh=rLS9AhLAgTNBe3SpS78H5C9UXDb3UKUOZbfDG/3TmDY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GK8/4/hB6jLeG1QQaattqw9Jmyap9xuZG7AlKcAH813HRArc9LYG1x4V1BfSXgv7z
	flIVyC2ZizlMENaH7U1vxZSlV5uZDaN2zDVoqD/zb5zKJpaWIgItW/XAN0QMqDm2Ys
	mIPnElbj79FgCYnXH3ShQ1DOgSlpKKu+pbeRfPTc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6E1GEQt004767
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 20:16:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 20:16:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 20:16:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6E1GEj4025394;
	Fri, 13 Jul 2018 20:16:14 -0500
Date: Fri, 13 Jul 2018 21:15:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180714011535.GO25410@beryl>
References: <1531515249-12170-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1531515249-12170-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v4 0/3] Enable SGX on k3 (AM654x)
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
X-List-Received-Date: Sat, 14 Jul 2018 01:16:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! Looks good now, I'll merge it.


On Fri, Jul 13, 2018 at 04:54:06PM -0400, Eric Ruei wrote:
> Enable SGX on k3 (AM654x)
> 
> Eric Ruei (3):
>   conf: machine: k3: enable sgx
>   ti-sgx-ddk-um: add k3 (AM654x) support
>   ti-sgx-ddk-km: add k3 (AM654x) support
> 
>  conf/machine/include/k3.inc                        |  4 ++--
>  ...14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} | 12 +++++-------
>  .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  1 +
>  ...14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 22 +++++-----------------
>  4 files changed, 13 insertions(+), 26 deletions(-)
>  copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} (73%)
>  copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (81%)
> 
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

