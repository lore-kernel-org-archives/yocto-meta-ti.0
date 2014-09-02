Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52EB8E00524; Tue,  2 Sep 2014 09:44:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D664E004A0
	for <meta-ti@yoctoproject.org>; Tue,  2 Sep 2014 09:44:46 -0700 (PDT)
Received: by mail-yh0-f50.google.com with SMTP id f10so4413262yha.37
	for <meta-ti@yoctoproject.org>; Tue, 02 Sep 2014 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=Uj1QakhXk5VN5u50YsSJphvvOb4ISjW9viygxft/Wo4=;
	b=yyL0uqtZcYCdloUuvcjLlR4+xpGJftW7d8bOsI7XiIgKDnsAG7vsH/zCIARyR4/xOt
	/iI0i4kZKhKe9f57go+2YpEXw4gl4e2VkDn1nCNAfNC3LWe16sWulNfYRPSJP3HMCZa5
	u+WYS+/yL+G/OT0G3LP7MgSG7SMBM2U6Bh4xHPMOWJY++f+a6iOJ0+OnHLuUrRXjTW2k
	jzCOcKH0fxJtPpmWfGEmNBYbNbaWmJcFNnMkX3SK8smkq7CTCAS7IHkQcUdatXDsQutL
	+i8FECWHf/zK2Xwz90FeF50yC2f9qtrSOcKlErp7nzQ3ZPzEV+TTL/bv1CZDJT/j0ugj
	QPvA==
X-Received: by 10.236.31.4 with SMTP id l4mr2419555yha.158.1409676285536;
	Tue, 02 Sep 2014 09:44:45 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id b61sm4456151yhc.35.2014.09.02.09.44.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Sep 2014 09:44:44 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Tue, 2 Sep 2014 12:44:51 -0400
From: Tom Rini <trini@ti.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20140902164451.GV19374@bill-the-cat>
References: <5405349A.4050207@pabigot.com>
	<1409627490-28337-1-git-send-email-pab@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <1409627490-28337-1-git-send-email-pab@pabigot.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org, Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [ti-uboot][PATCH] mmc: restore capacity when switching to partition 0
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
X-List-Received-Date: Tue, 02 Sep 2014 16:44:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2014 at 10:11:30PM -0500, Peter A. Bigot wrote:

> The capacity and lba for an MMC device with part_num 0 reflects the
> whole device.  When mmc_switch_part() successfully switches to a
> partition, the capacity is changed to that partition.  As partition 0
> does not physically exist, attempts to switch back to the whole device
> will indicate an error, but should still restore the capacity setting.

In other words:
# mmc dev 0:1
...
# mmc dev 0:0

Fails?  And the following patch fixes it.

> 
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  drivers/mmc/mmc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
> index b5477b1..b05c6ee 100644
> --- a/drivers/mmc/mmc.c
> +++ b/drivers/mmc/mmc.c
> @@ -596,10 +596,11 @@ int mmc_switch_part(int dev_num, unsigned int part_num)
>  	ret = mmc_switch(mmc, EXT_CSD_CMD_SET_NORMAL, EXT_CSD_PART_CONF,
>  			 (mmc->part_config & ~PART_ACCESS_MASK)
>  			 | (part_num & PART_ACCESS_MASK));
> -	if (ret)
> -		return ret;
>  
> -	return mmc_set_capacity(mmc, part_num);
> +	if ((0 == ret) || ((-ENODEV == ret) && (0 == part_num)))

This is backwards from how we usually code things:

if ((ret == 0) || ((ret == -ENODEV) && (part_num == 0)))

And should have a comment above it that's a short summary of the commit
message so this doesn't get lost later on.

> +		ret = mmc_set_capacity(mmc, part_num);
> +
> +	return ret;
>  }
>  
>  int mmc_getcd(struct mmc *mmc)
> -- 
> 1.8.5.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

And speaking of getting lost, this isn't the U-Boot mailing list so the
change would get lost with the next release.  Please make sure to post
the next version to the u-boot ML as well and CC Pantelis.   Thanks!

-- 
Tom

