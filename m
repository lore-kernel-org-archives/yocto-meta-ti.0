Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.140743.1598034867471077343
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 11:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lWj2ev+A;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07LIYQS1000739
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 13:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598034866;
	bh=dZi+IZet98J7TbFNlzy76qZFXWplafu/Lb5BbyHxIrk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lWj2ev+AKgXzM9PenBl3pHRaE8MI+/vOuQyX53sPfP6BksXtqTRLa2IhvnArXSixK
	 uvzkQXtkDYGFQ5QbISzY/KrGv5BAYL74qzOAU/T0ceFbqgy8XL74ItSRh/T5xtWm4R
	 23awqCzePnsCVa9cgE9Iae06BDQSzqc6DlnHE3iA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07LIYQOo107707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 13:34:26 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 21
 Aug 2020 13:34:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 21 Aug 2020 13:34:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07LIYP4B042569;
	Fri, 21 Aug 2020 13:34:26 -0500
Date: Fri, 21 Aug 2020 14:34:25 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Lokesh Vutla <lokeshvutla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sekhar Nori <nsekhar@ti.com>,
        <m-erdahl@ti.com>, <m-karicheri2@ti.com>
Subject: Re: [PATCH 0/3] prueth: Update all prueth firmwares
Message-ID: <20200821183425.GI29812@beryl>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200821073238.18926-1-lokeshvutla@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, Lokesh. Overall this looks fine, I had few minor comments.


On Fri, Aug 21, 2020 at 01:02:35PM +0530, Lokesh Vutla wrote:
> Update the following firmwares to latest version:
> - Prueth dual emac
> - Prueth switch firmware
> - Prueth HSR firmware
> - Prueth PRP firmware
> 
> Also change the recipe to pick the dual emac and swith firmwares from
> ti-linux-firmware repos.
> 
> Re-sending this series after subscribing to lists.yoctoproject.org
> as the previous post was rejected.
> 
> Lokesh Vutla (3):
>   prueth-hsr/prp: Update hsr/prp firmwares to latest
>   prueth-fw: Package the firmware images from ti-linux-firmware
>   prusw-fw: Package the firmware images from ti-linux-firmware
> 
>  recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb      | 38 +++++++++++++++
>  recipes-bsp/prueth-fw/prueth-fw_git.bb        | 47 -------------------
>  ...{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} |  4 +-
>  ...{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} |  4 +-
>  recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb        | 38 +++++++++++++++
>  recipes-bsp/prusw-fw/prusw-fw_git.bb          | 40 ----------------
>  recipes-kernel/linux/linux-ti-staging_5.4.bb  |  1 -
>  7 files changed, 82 insertions(+), 90 deletions(-)
>  create mode 100644 recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
>  delete mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bb
>  rename recipes-bsp/pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} (93%)
>  rename recipes-bsp/pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} (93%)
>  create mode 100644 recipes-bsp/prusw-fw/prusw-fw_3.0.0.bb
>  delete mode 100644 recipes-bsp/prusw-fw/prusw-fw_git.bb
> 
> -- 
> 2.23.0
> 
