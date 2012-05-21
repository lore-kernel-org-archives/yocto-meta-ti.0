Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54719E0044A
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 07:55:54 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4D00A6YO4PYA11@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 May 2012 09:55:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D2775201AD; Mon,
	21 May 2012 10:55:37 -0400 (EDT)
Date: Mon, 21 May 2012 10:55:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Eric B?nard <eric@eukrea.com>
Message-id: <20120521145537.GA12334@denix.org>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
	<20120518214833.GB4208@denix.org> <20120519102215.0b8edf4e@eb-e6520>
MIME-version: 1.0
In-reply-to: <20120519102215.0b8edf4e@eb-e6520>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Mon, 21 May 2012 14:55:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, May 19, 2012 at 10:22:15AM +0200, Eric B?nard wrote:
> Hi Denys,
> 
> Le Fri, 18 May 2012 17:48:33 -0400,
> Denys Dmytriyenko <denis@denix.org> a ?crit :
> > Netra and Centaurus are internal codenames for the SoC families behind those 
> > part numbers Koen mentioned above. Those codenames are not publicly advertised 
> > and Koen is just showing off after being on the inside... :) :-P
> > 
> these names were already dislosed on TI's website, for example :
> http://focus.ti.com/asia/download/1105-techday-abstracts-tw.pdf
> http://processors.wiki.ti.com/index.php/DM814x_AM387x_PSP_Flashing_Tools_Guide
> 
> and are even in your slides where I first saw them ;-)
> https://wiki.yoctoproject.org/wiki/images/b/b3/Meta-ti.pdf

Good catch, but I didn't say they were secret :) I only said they were not 
advertised or marketed as official platform names. You can always find those 
references deep inside the code in several places...

So, it's understandable that customers may not know them, but it's fine to use 
those references among the developers.

-- 
Denys

