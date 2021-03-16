Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.811.1615919381817843716
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 11:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gzxBz1Yq;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 23C0F38C058A
	for <meta-ti@yoctoproject.org>; Tue, 16 Mar 2021 18:29:40 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GITaYe003416;
	Tue, 16 Mar 2021 13:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615919376;
	bh=KT7D+l6lelM/3Eb9y02sb9sCgay+Ucc0sdWFr+Nj1UA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gzxBz1YqrNO8l0BM6Eep1aZ70jzTHMHOvopKAWV1k4KMmzSm5ckKibWynjeB5F//F
	 SfuGE3LWhhr3BF0bBi1SX8LlhYTDf6pHbXS3c/H+TtDYUc4/FohDML1FfuEeid3GCW
	 fn0dK7mjYvXPNQ9HMDoZdPsTpV/RbiJJ60Cd3Pbk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GITawX074083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 13:29:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 16
 Mar 2021 13:29:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 16 Mar 2021 13:29:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GITaGj023880;
	Tue, 16 Mar 2021 13:29:36 -0500
Date: Tue, 16 Mar 2021 13:29:36 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Saurabh Narang <saurabhnarang@ti.com>
CC: <nikhil.nd@ti.com>, <meta-ti@yoctoproject.org>, <praneeth@ti.com>,
        <lokeshvutla@ti.com>, <kishon@ti.com>, <nsekhar@ti.com>,
        <hnagalla@ti.com>, <saurabhnarang@ti.com>
Subject: Re: [meta-ti][dunfell PATCH v2] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210316182936.r4xmdxps6mz7meyt@parched>
References: <20210310161337.31072-1-nikhil.nd@ti.com>
 <20210310171144.GW4892@denix.org>
 <20210310172222.qkssgid2arel3aky@sapling>
 <20210312231143.GE4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210312231143.GE4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:11-20210312, Denys Dmytriyenko wrote:
> On Wed, Mar 10, 2021 at 11:22:22AM -0600, Nishanth Menon wrote:
> > On 12:11-20210310, Denys Dmytriyenko wrote:
> > > On Wed, Mar 10, 2021 at 09:43:37PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > > > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> > > > 
> > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > 
> > > Reviewed-by: Denys Dmytriyenko <denis@denix.org>
> > > 
> > > 
> > > > ---
> > > > 
> > > > Notes:
> > > >     Changes from v1:
> > > >     * Update the version in the recipe filename
> > > > 
> > > >  .../wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb}  | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >  rename recipes-bsp/wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb} (86%)
> > > > 
> > > > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > > > similarity index 86%
> > > > rename from recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > > rename to recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > > > index a52ec898..50b6c297 100644
> > > > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > > > @@ -7,8 +7,7 @@ SRC_URI = " \
> > > >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> > > >  "
> > 
> > Just curious, is there a periodic upgrade plan in upstream [1] - last commit is
> > [2] ?
> 
> Based on [3], I believe this is a question for Saurabh Narang <saurabhnarang@ti.com>
> And would also like to hear the answer...


Saurabh,
	any suggestions?
> 
> 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/ti-connectivity/wl18xx-fw-4.bin?id=d5f9eea5a251d43412b07f5295d03e97b89ac4a5
> 
> [3] https://git.ti.com/cgit/wilink8-wlan/wl18xx_fw/log/
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
