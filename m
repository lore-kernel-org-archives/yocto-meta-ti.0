Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDDC6E00747
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 20:10:33 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244ASfS020192;
	Sun, 4 Mar 2012 04:10:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20135-01; Sun,  4 Mar 2012 04:10:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244AHgA020186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 4 Mar 2012 04:10:20 GMT
Message-ID: <1330834220.3949.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 03 Mar 2012 20:10:20 -0800
In-Reply-To: <95AEAC88-7C37-41CD-B0FA-DF85BE77D2FC@dominion.thruhere.net>
References: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
	<20120303135523.GJ24667@denix.org>
	<95AEAC88-7C37-41CD-B0FA-DF85BE77D2FC@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] SOC_FAMILY: add to MACHINE_OVERRIDES locally
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
X-List-Received-Date: Sun, 04 Mar 2012 04:10:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-03 at 20:01 +0100, Koen Kooi wrote:
> Op 3 mrt. 2012, om 14:55 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > On Sat, Mar 03, 2012 at 11:53:06AM +0100, Koen Kooi wrote:
> >> This breaks the hard dependency on Angstrom for getting a sane set of 
> >> recipes.
> >> 
> >> The variable name is kept the same and the actual code moved from 
> >> angstrom.inc to soc-family.inc to make it clear what it is doing and how.
> > 
> > Ah, nice workaround until/if it gets accepted upstream to OE-Core! Thanks, 
> > Koen.
> 
> The consensus at ELC was that these kind of tweaks should be done at
> the machine level now that we have MACHINE_OVERRIDES seperated out. If
> a lot of BSPs are going to use SOC_FAMILY we can try to push it into
> OE-core again. But currently we wouldn't stand a chance.

MACHINE_OVERRIDES was added to give people a generic way of extending
overrides from a machine context. This works for various situations such
as the "x86" override that made more sense than the previous 386|486|
586|xxx madness as well as providing a mechanism for SOC_FAMILY and
other uses.

I guess the .inc file could make it into OE-Core but I don't see much
value in adding SOC_FAMILY directly as a standard variable at this
point.

Cheers,

Richard


