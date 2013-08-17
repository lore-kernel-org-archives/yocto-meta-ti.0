Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48D53E00441
	for <meta-ti@yoctoproject.org>; Sat, 17 Aug 2013 14:45:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7HLjiBd011043;
	Sat, 17 Aug 2013 16:45:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7HLjixW019284;
	Sat, 17 Aug 2013 16:45:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 17 Aug 2013 16:45:44 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7HLjih7008081;
	Sat, 17 Aug 2013 16:45:44 -0500
Date: Sat, 17 Aug 2013 17:45:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130817214543.GS4931@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Sat, 17 Aug 2013 21:45:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 16, 2013 at 05:39:49PM -0400, Brian Hutchinson wrote:
> I can confirm that the Kevin Hilman mailbox patch that I posted the URL to
> on the e2e site fixes the mbox problem and my 2.6.37 kernel built with the
> OE Core toolchain (gcc 4.8) does in fact boot now!  I have a login prompt!

BTW, didn't I tell you to look for a possible fix in one of those TI81x repos 
on arago-project.org? :) It was right there, the third from the top!

http://arago-project.org/git/projects/?p=linux-dvr-rdk-dm81xx.git;a=commitdiff;h=b5c066e7c670e830c322693b2c9da65508c189b2


> So to recap.  Sakoman head.S patch, the two memset patches Khem mentioned,
> and this Hilman mailbox patch is what I applied.
> 
> Thank you guys for putting up with me :)

Congratulations, you persistence has paid off! :)

Looking forward to seeing patches from you, along with taking maintainership 
of TI81x platform in meta-ti... :)

-- 
Denys

