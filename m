Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0BC1E011F4; Fri, 13 Jul 2018 10:30:29 -0700 (PDT)
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
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C12C6E00C88
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 10:30:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DHUSnE009819
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531503028;
	bh=dAXYu9j2sIVU10roY/E3LQUr5oUDoH7jU5YDeWN1mi8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uKMFFAAn4Lv8dU9C9DNYHS8lMeZTUF9/tzq3ncKiP4MId52kR7GAZVXFQNDTH2OOk
	oloKvQ5Eh2iuiD8Wu+Yc+IYeP2CZ95Q75rPgTDtpiUcZzccAaCkQJ+bn2RUN9sqrXr
	Lbn+q23N5nHrNMB+52IWDKu+GcG7JwocsLfeTevE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DHUSQo008874
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:30:28 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 12:30:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 12:30:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DHUR37021016;
	Fri, 13 Jul 2018 12:30:27 -0500
Date: Fri, 13 Jul 2018 13:29:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180713172948.GF25410@beryl>
References: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 13 Jul 2018 17:30:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

Thanks for addressing most of my comments! This looks much better, but there 
are still couple issues - please see inside.


On Wed, Jul 11, 2018 at 11:45:28AM -0400, Eric Ruei wrote:
> Enable SGX on k3 (AM654x)
> 
> Eric Ruei (3):
>   conf: machine: k3: enable sgx
>   ti-sgx-ddk-um: add k3 (AM654x) support
>   ti-sgx-ddk-km: add k3 (AM654x) support
> 
>  conf/machine/include/k3.inc                        |  4 +-
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  | 92 ++++++----------------
>  .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  1 +
>  ...14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 10 +--
>  4 files changed, 33 insertions(+), 74 deletions(-)
>  copy recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb => recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb (2%)
>  copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (93%)
> 
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

