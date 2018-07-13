Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B0AFE0121E; Fri, 13 Jul 2018 11:20:05 -0700 (PDT)
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
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11DDBE0110F
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 11:20:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DIK4YS004476
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 13:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531506004;
	bh=8iSHHsw7GPn8v/44BA9t3HKNXojtnbvchu3W8gpN42w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bvHVedKe/nwzx59g1cLJkA4c6WHWK4qinY8OaBTyklzGJmSFgh5//As0elNfMymM4
	a2VIsfbVxH44ZN5zFqKAbZ9FZmYYZLTTbQ6rwM742WyDioxHZSHNmg+H/x77Ki2ly2
	4aRevjorH77X2oHF8MqVR28EJAyV3RJjHq8+dhS4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIK4vt028333
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 13:20:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:20:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 13:20:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIK3eT024871;
	Fri, 13 Jul 2018 13:20:03 -0500
Date: Fri, 13 Jul 2018 14:19:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20180713181924.GI25410@beryl>
References: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
	<20180713172948.GF25410@beryl>
	<60789283c2234ef6b21e183e777eb84f@ti.com>
MIME-Version: 1.0
In-Reply-To: <60789283c2234ef6b21e183e777eb84f@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 0/3] Enable SGX on k3 (AM654x)
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
X-List-Received-Date: Fri, 13 Jul 2018 18:20:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 13, 2018 at 02:11:18PM -0400, Ruei, Eric wrote:
> I do not see any comments on this one.

Sorry for the confusion - I meant inside the patches themselves, not the cover 
letter.


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, July 13, 2018 1:30 PM
> To: Ruei, Eric
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2 0/3] Enable SGX on k3 (AM654x)
> 
> Eric,
> 
> Thanks for addressing most of my comments! This looks much better, but there 
> are still couple issues - please see inside.
> 
> 
> On Wed, Jul 11, 2018 at 11:45:28AM -0400, Eric Ruei wrote:
> > Enable SGX on k3 (AM654x)
> > 
> > Eric Ruei (3):
> >   conf: machine: k3: enable sgx
> >   ti-sgx-ddk-um: add k3 (AM654x) support
> >   ti-sgx-ddk-km: add k3 (AM654x) support
> > 
> >  conf/machine/include/k3.inc                        |  4 +-
> >  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  | 92 ++++++----------------
> >  .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  1 +
> >  ...14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 10 +--
> >  4 files changed, 33 insertions(+), 74 deletions(-)
> >  copy recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb => recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb (2%)
> >  copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (93%)
> > 
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

