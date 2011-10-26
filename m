Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 035E5E005BB
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 00:02:15 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTN00JD1VJET4F6@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 26 Oct 2011 02:02:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5324B14AF64; Wed,
	26 Oct 2011 03:02:02 -0400 (EDT)
Date: Wed, 26 Oct 2011 03:02:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jason Kridner <jkridner@beagleboard.org>
Message-id: <20111026070202.GC15391@denix.org>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<82EB1A3D-8AAA-4D21-AEE9-4A66BFF79DD5@dominion.thruhere.net>
	<CA+T6QPnrARwPw4VnkRw1s1V=0qFtYTiE_PJY94K92fLAzj9NRQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+T6QPnrARwPw4VnkRw1s1V=0qFtYTiE_PJY94K92fLAzj9NRQ@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org, Joel A Fernandes <joelagnel@ti.com>,
	Koen Kooi <koen@beagleboard.org>
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable	usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 07:02:16 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Wed, Oct 26, 2011 at 02:49:16AM -0400, Jason Kridner wrote:
> On Wed, Oct 26, 2011 at 1:41 AM, Koen Kooi <koen@beagleboard.org> wrote:
> > As a general remark: could you also list the git repo where your patches can
> > be pulled from? That will save me a lot of email troubles while traveling.
> >
> > Op 26 okt 2011, om 02:13 heeft Joel A Fernandes het volgende geschreven:
> >
> >> Enable the PL2303 usb-to-serial driver required for serial output
> >> from the beaglebone tester.
> >>
> >> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> >> ---
> >> .../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig |    3 ++-
> >> recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    2 +-
> >> 2 files changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git
> >> a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> >> b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> >> index 4b3c21d..478ec3e 100644
> >> --- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> >> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> >> @@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=y
> >> # USB port drivers
> >> #
> >> # CONFIG_USB_USS720 is not set
> >> -# CONFIG_USB_SERIAL is not set
> >> +CONFIG_USB_SERIAL=y
> >> +CONFIG_USB_SERIAL_PL2303=y
> >>
> >> #
> >> # USB Miscellaneous drivers
> >> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> >> b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> >> index bffebea..fbee01f 100644
> >> --- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> >> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> >> @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
> >>
> >> BRANCH = "master"
> >> SRCREV = "1955a86594526e18f03c8d62db81119ffc4ccf0f"
> 
> I believe this SRCREV is only working for you because it is in your
> cache.  Can you confirm with a kernel revision that is currently in
> the tree?

For a second you got me scared that the tree was rebased again. But I believe
that SRCREV is still there:

http://arago-project.org/git/projects/?p=linux-am33x.git;a=commit;h=1955a86594526e18f03c8d62db81119ffc4ccf0f

Not the latest commit though.           

--
Denys

