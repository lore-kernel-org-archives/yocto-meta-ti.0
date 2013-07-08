Return-Path: <tom.rini@gmail.com>
Received: from mail-gg0-f182.google.com (mail-gg0-f182.google.com
	[209.85.161.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E479E013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 11:14:53 -0700 (PDT)
Received: by mail-gg0-f182.google.com with SMTP id f1so1710636ggn.41
	for <meta-ti@yoctoproject.org>; Mon, 08 Jul 2013 11:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=YW+FA7om2GnD64hIP17Csi0PAW/SHrANJdUxrphc/k8=;
	b=eVh+dEKY56oSpuwNUCwYInFpH2sg/DoAtcdCoTWYy2e3bvXVFE9o9337ewy4el4/Ip
	IO1JbPktWYfKPLOoSSDVjfB231Ixg6D1SHX7Yhh11no/Uwg3c6rxV6Gu8M7R5oA2/qN5
	x9PoK7DjPu49vIVcV+mye4KNWNoGwuBChkIVgzNnB8tjWDUJfVB9Quw+rG2jhlB1sWfb
	AzbWKO7CZhaRQuWVFRdR7niO/oP16UU7hjhccvhzvb6388UMHQG5lMkaBvlp+FFAgXin
	Cu3ZoKhM5JHeDOMRNrBsQUt2nAIW6oRl4KRzIodoHy8emFNm5ch5uQ74JlFhbJ2OuCH/
	MTkg==
X-Received: by 10.236.115.234 with SMTP id e70mr12806885yhh.121.1373307292127; 
	Mon, 08 Jul 2013 11:14:52 -0700 (PDT)
Received: from bill-the-cat (cpe-065-184-250-089.ec.res.rr.com.
	[65.184.250.89])
	by mx.google.com with ESMTPSA id m5sm38591434yha.23.2013.07.08.11.14.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 11:14:51 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Mon, 8 Jul 2013 14:14:57 -0400
From: Tom Rini <trini@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130708181457.GQ16630@bill-the-cat>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1307070755370.23001@oneiric>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: proper recipe to build for BBB using the meta-ti layer?
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
X-List-Received-Date: Mon, 08 Jul 2013 18:14:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 07, 2013 at 08:00:05AM -0400, Robert P. J. Day wrote:

> U-Boot SPL 2013.01.01 (Jul 06 2013 - 18:41:10)
> OMAP SD/MMC: 0
> ** Partition 1 not valid on device 0 **
> spl: fat register err - -1
> ### ERROR ### Please RESET the board ###
> 
>   this is exactly the same SD card i was using with meta-beagleboard
> generated image files. everything else about the build seemed fine.
> can someone verify a known good recipe for this? is there
> something different about the creation of the SD card? i'm currently
> doing another build from scratch to see if i messed anything up.

Can you see if backporting
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=9d956e0fefa39ba49250f61e3c7aa3dadafdb7fd
fixes the problem?  It should apply cleanly.  Thanks!

-- 
Tom

