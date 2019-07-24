Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 821A1E00DF7; Wed, 24 Jul 2019 11:38:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 105EAE00DB7
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 11:38:37 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OIcbEv111320;
	Wed, 24 Jul 2019 13:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563993517;
	bh=m6cjMHJ7rVdlrZfRIAE6RAfHW7j7klBMx+uawnh7vHc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E/oGOYNG5eP2jTFL1ZFMyXK86SJXwHfaiKkJ1jCIgLoLolW+YCASu6Wpj8dpubKDD
	X+9ltbhP67Lc5FKEYjL0I+TrOSFI3xeuYW12BOqJ8IPcikiJOSDFFCy1e+oftwrL8x
	TOjfVkDPBm2YKl8uYkoT+FGy7CBWsRiTUbMpe9xI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OIcaMc059426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jul 2019 13:38:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Jul 2019 13:38:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Jul 2019 13:38:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OIcaBx083945;
	Wed, 24 Jul 2019 13:38:36 -0500
Date: Wed, 24 Jul 2019 14:38:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190724183836.GC5700@beryl>
References: <CAMKF1srNYsmfwbARgY==LJURLeno6twZd21K9kH4mH7rTkpyhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srNYsmfwbARgY==LJURLeno6twZd21K9kH4mH7rTkpyhg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic license file exists for: Patrick-Powell in any provider
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
X-List-Received-Date: Wed, 24 Jul 2019 18:38:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, this is well known. I haven't had much luck finding the proper license 
text when I looked at it quite a while ago, so it's been on back-burner since.

-- 
Denys


On Wed, Jul 24, 2019 at 08:51:06AM -0700, Khem Raj wrote:
> Hi
> 
> Couple of recipes list Patrick-Powell in LICENSE filed but there is no
> file pertaining to this license
> in the license/ folder. This is flagged by build
> 
> WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic
> license file exists for: Patrick-Powell in any provider
> 
> here are recipes
> 
> 
> recipes-ti/devtools/ti-cgt-arm.inc:LICENSE = "(TI-TSPA &
> Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
> Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD &
> BSD-4-Clause"
> recipes-ti/devtools/ti-cgt6x_8.3.2.bb:LICENSE = "(TI-TSPA &
> Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
> Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
> 
> Thanks
> -Khem
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

