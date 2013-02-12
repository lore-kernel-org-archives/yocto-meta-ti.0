Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08BEDE004AB;
	Tue, 12 Feb 2013 11:16:30 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0MI40088PG6H2LL5@vms173015.mailsrvcs.net>; Tue,
	12 Feb 2013 13:16:09 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9E48D2008D; Tue,
	12 Feb 2013 14:15:53 -0500 (EST)
Date: Tue, 12 Feb 2013 14:15:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Raul Rosetto Munoz <munoz0raul@gmail.com>
Message-id: <20130212191553.GA1858@denix.org>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2013 19:16:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 07, 2013 at 06:26:46PM -0200, Raul Rosetto Munoz wrote:
> Hello All,
> I need to configure my yocto project to work with wifi dongle realteck
> rtl8192cu.
> 
> My first problem is that the module does not go up automatically rtl8192cu
> different than Angstron distro that when I plug the dongle all modules rise.
> 
> Another important difference is that on Angstron distro I have on /lib/udev
> the "firmware" binary file.  I really was not able to install this
> functionality in udev.

Have you looked at linux-firmware package? rtl8192* should be well supported.


> And How to make this firmware binary go to /lib/udev?

By default, firmware files go into /lib/firmware

-- 
Denys

