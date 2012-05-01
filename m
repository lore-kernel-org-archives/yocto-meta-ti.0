Return-Path: <tom.rini@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AEA0E0044D
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 12:23:34 -0700 (PDT)
Received: by ghbz10 with SMTP id z10so2833338ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=vEtrWuDhbW+WHKP7rIkRwroFnCGbDJRMlO2wFUc1ynU=;
	b=IL1gK58N9pzLOyjr5YOBx9uUX89AzOwAUUCv+q2V+XxzF6K4wERUq0pgDB5ux1T68Q
	lk0OUAPX9R+JnaOvtecX2Q3WI43dvg+z2JyC98xYUHxAR97zK6yCbz5r4Pv2ECBWKZV2
	/s8zGrOScES64H5xaVjY9eR+aVGkmz+b+zig5WrIDwzutyznr41F0A6577HOHWu/3xvk
	vXpJWirNxl1rkNPVjBWpkxg2RY1l/dI62MkUohiuIqRNjNrH68lbBAHR0J9HnPvTPCFr
	kpSbsb8R7W92og4S5JhMn8ELiYmuSCbG6byyXuIgbkwP9CYgvjjl7FGUKuIMuB/Ag8TP
	GQSw==
Received: by 10.60.30.3 with SMTP id o3mr5168305oeh.9.1335900214110;
	Tue, 01 May 2012 12:23:34 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id s8sm17264156oec.1.2012.05.01.12.23.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 12:23:33 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Tue, 1 May 2012 12:23:33 -0700
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120501192333.GA26889@bill-the-cat>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<1335899212-29869-4-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1335899212-29869-4-git-send-email-koen@dominion.thruhere.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 4/5] u-boot 2011.12: don't poke at uLCD7 settings from u-boot, it's handled in the kernel now
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 19:23:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 01, 2012 at 09:06:51PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../0003-beagleboard-add-support-for-scanning-loop-through-ex.patch  |    2 +-
>  recipes-bsp/u-boot/u-boot_2011.12.bb                                 |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Tom Rini <trini@ti.com>

-- 
Tom

