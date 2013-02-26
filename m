Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B3C4E002AB
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 10:08:26 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU00FOIADDFF20@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 12:08:12 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EF04A200BD; Tue,
	26 Feb 2013 13:08:00 -0500 (EST)
Date: Tue, 26 Feb 2013 13:08:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20130226180800.GJ6725@denix.org>
References: <1361853748-24166-1-git-send-email-denis@denix.org>
	<CAMKF1soyC8T4jau0jWrEHoGD_+OcpUBV3KtUeh5tT1OaHONemA@mail.gmail.com>
	<20130226062803.GH6725@denix.org>
	<CAMKF1sqiAL=RF6r3k7aAuUYeOVE3dTnizpLdkS_XD0ESNkfyYg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqiAL=RF6r3k7aAuUYeOVE3dTnizpLdkS_XD0ESNkfyYg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv2] linux-omap-psp: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 18:08:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 25, 2013 at 10:52:42PM -0800, Khem Raj wrote:
> On Mon, Feb 25, 2013 at 10:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> >
> > We have at least 3 kernel recipes of 2.6.37 version, hence the common location
> > for this patch. I don't plan on updating older kernels to work with gcc-4.7.
> 
> it depends on how its all organised. In my view something in files/
> applies to all recipes under that dir
> and then you have ${PN} and ${PN}-${PV} and so on to make it more and
> more specific. On another extreme you can also have a flat
> structure if you dont have conflicting patches. As it seems you have
> something in the middle

Yes, correct, the same patch applies to multiple different kernel recipes. 
Unfortunately, they all have different ${PN}, thus cannot share the same ${PN} 
or ${PN}-${PV} directories. And having patches residing in the common files/ 
directory when used by multiple recipes (but not all of them) is allowed and 
there are existing instances out there already...

-- 
Denys

