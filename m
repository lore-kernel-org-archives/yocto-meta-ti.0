Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65658E00799; Mon,  4 Aug 2014 19:19:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.48 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45986E004F1
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 19:19:08 -0700 (PDT)
Received: by mail-pa0-f48.google.com with SMTP id et14so420767pad.35
	for <meta-ti@yoctoproject.org>; Mon, 04 Aug 2014 19:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rhAhpmzRZKgJPhaKDjPFVI7y+kfsanB+bwmSj3II0LU=;
	b=GsG9FMvaBzxfeKeskQDR9aaDMRJ6b7HT+QlIi/9IiI6eopH1FrpHiWDeblRhdjcu6V
	BYbqlRStVehskHnfvMjFfulMtGNtgEflJOcordtBhq5+tFskrcGfy4jT+WaMvWaIDzks
	t10vxOT2BjCPLTv5x9iO+bfwk4gskkRC14y9+bCaE6UxIaLIzt1B/NFYkcu2CWm7eJ2M
	nqCfcaWBWR4cGQC3WBuS6vO7vhq4c9uIS6pmd81DMU2POxC4QUF6Ulf6kGSfk8puKXYP
	4TtXuzymn1gAIVeNyn9eNn3iE5NEI2Fqy9X8HjAp+8us04Gp1VbTCQQkt/nS0pgDaUil
	X8ng==
X-Received: by 10.70.38.134 with SMTP id g6mr608052pdk.135.1407205148540;
	Mon, 04 Aug 2014 19:19:08 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id rr8sm222892pbc.30.2014.08.04.19.19.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 19:19:08 -0700 (PDT)
Date: Mon, 4 Aug 2014 19:22:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20140805022236.GA3867@haswell>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
	<CAP71WjwdFhrz=c-RJHyte7vLRVSex1DxBX=4nR7DHJVHY64BXA@mail.gmail.com>
	<20140805002000.GB2572@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140805002000.GB2572@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Tue, 05 Aug 2014 02:19:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-04 20:20:00, Denys Dmytriyenko wrote:
> On Tue, Aug 05, 2014 at 01:24:18AM +0200, Nicolas Dechesne wrote:
> > Hi,
> > 
> > On Wed, Jul 30, 2014 at 3:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > index b505640..c223c88 100644
> > > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > @@ -3,8 +3,6 @@ DESCRIPTION = "Linux kernel for TI devices"
> > >  LICENSE = "GPLv2"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > >
> > > -DEFAULT_PREFERENCE = "-1"
> > > -
> > 
> > i just noticed this change ^^. Was this intentional? This is a big
> > change which could have been in its own commit, or at least should
> > have been mentioned in the commit log... as it is it was lost in the
> > noise..
> 
> Yes, it was intentional.
> 

Wouldnt hurt if it was mentioned in commit log

