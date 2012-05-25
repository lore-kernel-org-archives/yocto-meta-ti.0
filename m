Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C2C5E01402
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 23:48:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4P6mPWS031448;
	Fri, 25 May 2012 07:48:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30513-02; Fri, 25 May 2012 07:48:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4P6mHAF031442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 May 2012 07:48:18 +0100
Message-ID: <1337928496.8248.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 25 May 2012 07:48:16 +0100
In-Reply-To: <4FBE4DE9.30501@mlbassoc.com>
References: <4FBBB531.8020401@communistcode.co.uk>
	<4FBBB786.8030501@mlbassoc.com> <4FBBB8E9.1040700@communistcode.co.uk>
	<20120522163158.GB15020@denix.org> <4FBCA367.701@communistcode.co.uk>
	<4FBCC147.90606@mlbassoc.com> <4FBCE8E4.6010208@communistcode.co.uk>
	<4FBE44EE.2070909@communistcode.co.uk> <4FBE4DE9.30501@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Beaglebone + Poky
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
X-List-Received-Date: Fri, 25 May 2012 06:48:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-24 at 09:04 -0600, Gary Thomas wrote:
> I agree - there seem to be some recipes in meta-oe that don't play
> nice with a non-systemd setup like Poky.
> 
> Note: I was able to boot core-image-minimal built with meta-yocto + meta-oe
> in all configurations of EXTRA_IMAGE_FEATURES as long as 'dbg-pkgs' was
> not specified.  As soon as I added that feature, it fails to come up just
> as you observed.  I'm not sure why (and I'm not too motivated to research
> more, I've already built this thing about 20 times in different ways...)

That is a useful data point to have though, thanks for mentioning it on
the list!

I wonder if that somehow indirectly pulls in systemd itself?

Cheers,

Richard




