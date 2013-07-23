Return-Path: <michael@amarulasolutions.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A6B1E013E8
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:24:22 -0700 (PDT)
Received: by mail-we0-f177.google.com with SMTP id m46so846392wev.36
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent
	:x-gm-message-state;
	bh=mrWFisb5Qrk4up28Sdoa2OCs5AlJZhEpGEVHsEL/vmM=;
	b=SoLszgArhMeAFARrt+LRDyLbtj1hsqzPZR6OE5sI2btp5Oh2wzT4u4kQqoQekPVP2D
	3uXTvCjoW1OTZGV3kUYHMXRic+3tYz3HFf9PrI4OmkVhqiXitzMfsTX/GzSRhCIWIaLu
	4XTXsb87pS2U9raSJpmsjS++ONCmS+AktEc+zEW4ThoCRLKnsbWj4MGtHgFqydLM+EVP
	0++e4jMlzEmuQ8bU9PrMBdkF4yGDOfQ+gjM257ibGYiNycOIdFT5AiNQC1UirmbpGtNY
	59x/nIu8M5bG4pbdRh++GHm0W19EN8MFjT3xJedZOcFjUMBdjTZCL49lwsYwv9s1QVzu
	82QA==
X-Received: by 10.180.98.233 with SMTP id el9mr235583wib.54.1374611062072;
	Tue, 23 Jul 2013 13:24:22 -0700 (PDT)
Received: from panicking (net-2-39-208-255.cust.dsl.vodafone.it.
	[2.39.208.255])
	by mx.google.com with ESMTPSA id fs8sm829989wib.0.2013.07.23.13.24.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 13:24:21 -0700 (PDT)
Date: Tue, 23 Jul 2013 22:24:17 +0200
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20130723202417.GB10067@panicking>
References: <20130723200931.GA10067@panicking>
 <20130723202110.GB32068@edge>
MIME-Version: 1.0
In-Reply-To: <20130723202110.GB32068@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQksjXeEP7VKQsZpJbUBCilLSFkD0PE8vecKBrMwgiLroLbUfRT0vj6oziDPaophzCkmpNX5
Cc: meta-ti@yoctoproject.org
Subject: Re: Unable to compile am180x-evm + gstreamer-ti
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
X-List-Received-Date: Tue, 23 Jul 2013 20:24:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On Tue, Jul 23, 2013 at 04:21:11PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 23, 2013 at 10:09:31PM +0200, Michael Trimarchi wrote:
> > Hi
> > 
> > I was having trouble in compilation of am180x-evm. The problem is that
> > I have this error:
> > 
> > Nothing PROVIDES 'ti-codecs-omapl138'. I'm using HOB right now and I
> > have included meta-ti repository. Any hints?
> 
> But am180x-evm is the platform without DSP, so you shouldn't use gstreamer-ti 
> with it.
> 
> -- 
> Denys

http://www.ti.com/product/omap-l138

Is there a reference platform for this cpu?

Michael

