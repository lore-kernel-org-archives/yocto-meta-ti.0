Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9615E0027C;
	Mon, 25 Feb 2013 12:25:13 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0MIS000LDM13ZA10@vms173019.mailsrvcs.net>; Mon,
	25 Feb 2013 14:24:55 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 59456200BD; Mon,
	25 Feb 2013 15:24:39 -0500 (EST)
Date: Mon, 25 Feb 2013 15:24:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Raul Rosetto Munoz <munoz0raul@gmail.com>
Message-id: <20130225202439.GD6725@denix.org>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
	<20130214160030.GD2539@edge>
	<CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
	<20130214162854.GF2539@edge>
	<CANmVirhviFJ8c8RKTLwgmvuwHp4KWkWt3+2dZozE+iemUSztQw@mail.gmail.com>
	<CANmViri6ZGaY1+_a06Zu+CXgJVNhfc8-5UQ23RFgC2fn-MNCiw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CANmViri6ZGaY1+_a06Zu+CXgJVNhfc8-5UQ23RFgC2fn-MNCiw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Wifi Module + udev configs
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
X-List-Received-Date: Mon, 25 Feb 2013 20:25:13 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Mon, Feb 18, 2013 at 08:56:06AM -0300, Raul Rosetto Munoz wrote:
> Any suggestions?
> 
> I really do not know what to do, the file "/lib/udev/firmware" never appear.

FYI, starting with 176, udev handles loading firmware images internally, hence 
dropping the /lib/udev/firmware binary. But there were some bugs related to 
that functionality, which got fixed in version 178...

http://git.kernel.org/?p=linux/hotplug/udev.git;a=blob;f=ChangeLog;hb=HEAD
http://upstream-tracker.org/changelogs/libudev/181/changelog.html

As I said before, if you are using Danny branch, then you should stick to the 
proven udev-164 that is in oe-core, unless you really want to have systemd, in 
which case you look into meta-openembedded...

-- 
Denys


> 2013/2/14 Raul Rosetto Munoz <munoz0raul@gmail.com>
> 
> > Now Im with 173 from meta-fsl bbapend, but I tryed with many others from
> > meta-oe and poky.
> >
> >
> >
> >
> >
> >
> > 2013/2/14 Denys Dmytriyenko <denys@ti.com>
> >
> >> On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz wrote:
> >> > Denys,
> >> > There are something strange,
> >> >
> >> > First there are no  linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}
> >> > installed at rfs.
> >>
> >> I was talking about packages, looks like you have them already installed.
> >>
> >>
> >> > raul@phi04:.../tmp/deploy/images$ find
> >> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name "*8192*"
> >> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E
> >> >
> >> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192sefw.bin
> >> >
> >> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192defw.bin
> >> >
> >> > Another problem is that "/lib/udev/firmware" are not installed to.
> >> >
> >> > raul@phi04:.../tmp/deploy/images$ find
> >> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name "*firmware*"
> >> > raul@phi04:.../tmp/deploy/images$
> >>
> >> What is your udev version?
> >>
> >>
> >> > But I can see theses files at my "tmp/sysroots/beaglebone"
> >> >
> >> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name
> >> "*8192*"
> >> > lib/firmware/RTL8192E
> >> > lib/firmware/rtlwifi/rtl8192sefw.bin
> >> > lib/firmware/rtlwifi/rtl8192defw.bin
> >> > lib/firmware/rtlwifi/rtl8192cfw.bin
> >> > lib/firmware/rtlwifi/rtl8192cufw.bin
> >> >
> >> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name
> >> "*firmware*"
> >> > lib/udev/firmware
> >> > lib/udev/rules.d/50-firmware.rules
> >> >
> >> > I tryed copy this files for the sdcard but doesnt work.
> >> >
> >> > Do you have any suggest?
> >> >
> >> > Thanks for all help.
> >>
> >
> >
> >
> > --
> > *Raul Rosetto Muñoz*
> >
> 
> 
> 
> -- 
> *Raul Rosetto Muñoz*

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


