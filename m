Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0D51E00347
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2012 14:54:08 -0700 (PDT)
Received: (qmail 12567 invoked by uid 1003); 28 Aug 2012 21:54:08 -0000
Received: from unknown (HELO ?10.50.11.73?) (philip@opensdr.com@205.168.82.250)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Aug 2012 21:54:07 -0000
Message-ID: <503D3DFE.3020000@balister.org>
Date: Tue, 28 Aug 2012 15:54:06 -0600
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
In-Reply-To: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
X-Forwarded-Message-Id: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
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
X-List-Received-Date: Tue, 28 Aug 2012 21:54:09 -0000
X-Groupsio-MsgNum: 1453
Content-Type: multipart/mixed; boundary="------------040807080704030004030203"

--------------040807080704030004030203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

FYI.


-------- Original Message --------
Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
Date: Tue, 28 Aug 2012 17:11:56 -0400
From: Sebastián Bas Kana <sbaskana@gmail.com>
Reply-To: General mailing list for gumstix users. 
<gumstix-users@lists.sourceforge.net>
To: General mailing list for gumstix users. 
<gumstix-users@lists.sourceforge.net>

I used meta-gumstix and had to add meta-ti, but the latter has some issues
with licensing checksums and broken dependencies, so I removed the
conflicting files and had to build the core-image-minimal, as the "base"
one fails to build the root filesystem.

To enable WPA Wifi I followed what is explained on this thread:

http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/631

Is there a cleaner way to do this? Why is meta-ti broken?

Thank you for your help!

Sebastián

On Fri, Aug 24, 2012 at 4:48 PM, Andreas Müller <
schnitzeltony@googlemail.com> wrote:

> On Fri, Aug 24, 2012 at 5:27 PM, Sebastián Bas Kana <sbaskana@gmail.com>
> wrote:
> > Hi Guys,
> >
> > Has anyone been able to build a Wifi (WPA) enabled image for the overo
> with
> > Yocto?
> >
> > I keep getting errors when I try to configure wlan0. How can I get the
> > drivers working?
> >
> > Thank you in advance!
> >
> > Sebastián
> >
> with meta-gumstix and networkmanager in image (e.g [1]) I have no
> problem to connect my hidden WPA2 network and setup is easy.
>
> Andreas
>
> [1]
> http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-base-image.bb
>
>
> ------------------------------------------------------------------------------
> Live Security Virtual Conference
> Exclusive live event will cover all the ways today's security and
> threat landscape has changed and how IT managers can respond. Discussions
> will include endpoint security, mobile security and the latest in malware
> threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
> _______________________________________________
> gumstix-users mailing list
> gumstix-users@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>




--------------040807080704030004030203
Content-Type: text/plain; charset=UTF-8;
 name="Attached Message Part"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message Part"

------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/

--------------040807080704030004030203
Content-Type: text/plain; charset=UTF-8;
 name="Attached Message Part"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message Part"

_______________________________________________
gumstix-users mailing list
gumstix-users@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/gumstix-users


--------------040807080704030004030203--
