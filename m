Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AE1DE0044D
	for <meta-ti@yoctoproject.org>; Sun,  8 Apr 2012 18:55:17 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2600MV6VZ88420@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 08 Apr 2012 20:54:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8D4F3201CF; Sun,
	08 Apr 2012 21:54:44 -0400 (EDT)
Date: Sun, 08 Apr 2012 21:54:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20120409015444.GE10246@denix.org>
References: <4F7C7174.8090103@mlbassoc.com> <4F7CB454.1050709@mlbassoc.com>
	<4F7DBD63.1060105@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <4F7DBD63.1060105@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Can't build ti-dmai
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
X-List-Received-Date: Mon, 09 Apr 2012 01:55:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 05, 2012 at 09:42:27AM -0600, Gary Thomas wrote:
> On 2012-04-04 14:51, Gary Thomas wrote:
> >On 2012-04-04 10:06, Gary Thomas wrote:
> >>|
> >>| Executing make in subdirectory Makefile...
> >>| make: Entering an unknown directory
> >>| make: *** Makefile: Not a directory. Stop.
> >>| make: Leaving an unknown directory
> >>| make[1]: *** [Makefile] Error 2
> >>| make[1]: Leaving directory
> >>`/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai/apps'
> >>
> >>
> >
> >This line in the Makefile is getting strange/different results:
> >SUBDIRS = $(sort $(dir $(wildcard */)))
> >
> >I've found the weirdness, but I don't understand what's going on. I changed
> >the Makefile to print $(SUBDIRS) to try and figure it out.
> >
> >When bitbake runs make in
> >/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai/apps
> >
> >the result is
> >Makefile.app/ Makefile/ Makefile~/ app_common.cfg/ app_common.tci/ audio_decode1/ audio_decode_io/ audio_decode_io1/ audio_encode1/ audio_encode_io1/ dmai.gel/ fc_common.cfg/
> >image_decode_io/ image_decode_io1/ image_encode_io/ image_encode_io1/ speech_decode1/ speech_decode_io1/ speech_encode1/ speech_encode_io1/ video_decode_io/ video_decode_io2/
> >video_display/ video_encode_io/ video_encode_io1/ video_encode_io_multich1/ video_loopback/ video_loopback_blend/ video_loopback_convert/ video_loopback_copy/ video_loopback_resize/
> >
> >the real result should be
> >audio_decode1/ audio_decode_io/ audio_decode_io1/ audio_encode1/ audio_encode_io1/ image_decode_io/ image_decode_io1/ image_encode_io/ image_encode_io1/ speech_decode1/
> >speech_decode_io1/ speech_encode1/ speech_encode_io1/ video_decode_io/ video_decode_io2/ video_display/ video_encode_io/ video_encode_io1/ video_encode_io_multich1/ video_loopback/
> >video_loopback_blend/ video_loopback_convert/ video_loopback_copy/ video_loopback_resize/
> >
> >which I get if I execute make in that directory maually! The bitbake build
> >is failing because files are being treated as directories (listed in $(SUBDIRS))
> >
> >Can someone explain this? I also had the Makefile print the
> >value of $(MAKE) and it's always /usr/bin/make
> 
> It seems to be a bug (or change in behaviour) in make 3.82 which
> is on Fedora 16.  When I use make 3.81, the build succeeds.

Gary,

I've seen similar issues with make 3.82 here:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/9/focus=25

I fixed it with this patch:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/27

It probaly won't help with your problem though, maybe just a pointer... I 
won't be able to look into ti-dmai issues right away, but hopefully soon. 
Please let me know and/or send a patch if you find the solution for this 
yourself. Thanks.

-- 
Denys

