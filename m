Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBED2E0044D
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 12:23:52 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so8093079obb.35
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=kfO5G1AYUH+XK12Bxyek38VXtvUi7Ep8FpIxBQTL96M=;
	b=CM07nSRV4RW/ZTjo+XgAMpnF6UY/22aerKGlv8uNEGqmMNPsYatvFzi+eZmjCr137P
	uON3TqvNi12UQ63r8AQmvdjJtzVbuJLMVFuCRlzeSHO5Lo4QB8GXYGNnOhvCr15+0H/j
	qqsWN/ftFE82VjsBE5WhhMgGzjDeqT2jZyVwEFTTCliYcjyFhGZgeMuYNfM4N06bMtsf
	SF/nlTjNyR7IytpSRibNdRrfFoJB8kH8FeA+LSKzhy+hflbV6XKOVmZ+zVlqPzvmwsQx
	F94Yzo7bUFWUaatO7BKMH8nDOnhpR1kEX4oGOxqb5HPm679gyEbMa0mPtiuH9CDlSkxL
	xLww==
Received: by 10.60.172.231 with SMTP id bf7mr30718205oec.45.1335900232275;
	Tue, 01 May 2012 12:23:52 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id tx2sm21360445obb.8.2012.05.01.12.23.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 12:23:51 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Tue, 1 May 2012 12:23:52 -0700
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120501192352.GB26889@bill-the-cat>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<1335899212-29869-5-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1335899212-29869-5-git-send-email-koen@dominion.thruhere.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 5/5] u-boot 2011.12: switch beagleboard to ext4 to match beaglebone
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
X-List-Received-Date: Tue, 01 May 2012 19:23:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 01, 2012 at 09:06:52PM +0200, Koen Kooi wrote:
> Also add patch to increase ext2 read speed.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Tom Rini <trini@ti.com>

-- 
Tom

