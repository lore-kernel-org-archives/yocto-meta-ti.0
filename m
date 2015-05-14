Return-Path: <b.hutchman@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72D2DE009C1; Thu, 14 May 2015 15:16:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.hutchman[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CE7CE00985;
	Thu, 14 May 2015 15:16:49 -0700 (PDT)
Received: by obcus9 with SMTP id us9so63713922obc.2;
	Thu, 14 May 2015 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cppH6t/f6kl2ZHS1b3MOnHDb63/TcuXd/Js+7co2SA8=;
	b=OZR6dB/saoIDXZQ0kJzX392P91J2u6EOmaU+JwbrH2NMEijbPyvZKtutZb//vv3tmv
	Iyi1oY95zV9RscNniORvM3A79VuVPHHeWcwvhpOyTtjfc70WGJdGAsfb2X2Gxjhdf60t
	ZjuIt3imRa91Yo7YRG5Ggrdno3X7Ds7CpZZ5tbriBA6fz2vjPC2HoXO35hWxqGWzV3cf
	sLsIonqMyuaXjzxuRqIzNDqbn4aD9kbhzZHWP7unDL/YeODsnuCbJACjCqC01YuWqRaY
	alrZ9Pa3uM4lO9VyBKJJqudiPFXljeiavhp452Cr2br6CjckdR+k9FSBO2+b7h6AnG8I
	xQug==
MIME-Version: 1.0
X-Received: by 10.202.217.196 with SMTP id q187mr5258857oig.64.1431641809148; 
	Thu, 14 May 2015 15:16:49 -0700 (PDT)
Received: by 10.60.6.33 with HTTP; Thu, 14 May 2015 15:16:48 -0700 (PDT)
Received: by 10.60.6.33 with HTTP; Thu, 14 May 2015 15:16:48 -0700 (PDT)
In-Reply-To: <20150514220801.GD20022@denix.org>
References: <4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
	<5550FD98.1050507@windriver.com>
	<CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>
	<55521DB8.2070606@windriver.com> <20150514220801.GD20022@denix.org>
Date: Thu, 14 May 2015 18:16:48 -0400
Message-ID: <CAFZh4h9=cJG8aVbwvh_NjR24UTnCj9A44zHPs3rqEn_rdCfN3A@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, yocto@yoctoproject.org,
	=?UTF-8?B?U2NoYXVtbMO2ZmZlbCw=?= <J.Schaumloeffel@astro-kom.de>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Thu, 14 May 2015 22:16:51 -0000
Content-Type: multipart/alternative; boundary=001a113d57967ae0990516121582

--001a113d57967ae0990516121582
Content-Type: text/plain; charset=UTF-8

On May 14, 2015 6:08 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>
> On Tue, May 12, 2015 at 11:35:20AM -0400, Bruce Ashfield wrote:
> > On 2015-05-12 10:20 AM, Brian Hutchinson wrote:
> > >On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield
> > ><bruce.ashfield@windriver.com> wrote:
> > >>On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
> > >>>
> > >>>On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
> > >>><bruce.ashfield@windriver.com> wrote:
> > >>>>
> > >>>>It is plausible. But in theory, linux-dummy should still provide
> > >>>>what you need (but since it doesn't build anything, there is
> > >>>>no abi .. and no modules can be built against it) .. so the
> > >>>>error isn't graceful.
> > >>>>
> > >>>>Bruce
> > >>>
> > >>>
> > >>>I can confirm this same problem is happening to me.  I just updated
> > >>>one of my builds from 1.7 to 1.8 and am also getting my rootfs to
fail
> > >>>due to no abi kernel version:
> > >>
> > >>
> > >>We still have a race condition in the 1.8 branch for the population
> > >>of the build-artifacts directory.
> > >>
> > >>If modules start building, they'll race against the population of the
> > >>abiversion, and you may see that message.
> > >>
> > >>There's a proposed patch for master, but I don't think it is in
> > >>fido yet.
> > >>
> > >>Bruce
> > >
> > >Hi Bruce,
> > >
> > >I did some searches and looks like there are a number of 'race'
> > >condition fixes but it wasn't obvious which one I may need.  Is it
> > >this one:
> > >
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02d0a003d603266114512160b209876199241e98
> > >
> >
> > That's the one that should make sure that the shared workdir
> > (Which has the abiversion) is in place before building any modules.
> >
> > I can't say that it is exactly your issue, but it is the change
> > I was thinking of.
>
> Brian,
>
> Were you able to try the above mentioned commit against am180x in
meta-ti? Did
> it solve the missing abi kernel version? Thanks.
>
> --
> Denys

Hi Denys,

No, I got caught up in something else ... I'll try it tomorrow and report
back after I cherry pick that commit Bruce mentioned.

Regards,

Brian

--001a113d57967ae0990516121582
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 14, 2015 6:08 PM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailt=
o:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, May 12, 2015 at 11:35:20AM -0400, Bruce Ashfield wrote:<br>
&gt; &gt; On 2015-05-12 10:20 AM, Brian Hutchinson wrote:<br>
&gt; &gt; &gt;On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield<br>
&gt; &gt; &gt;&lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ash=
field@windriver.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;On 2015-05-11 02:10 PM, Brian Hutchinson wrote:<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield<br>
&gt; &gt; &gt;&gt;&gt;&lt;<a href=3D"mailto:bruce.ashfield@windriver.com">b=
ruce.ashfield@windriver.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;It is plausible. But in theory, linux-dummy shoul=
d still provide<br>
&gt; &gt; &gt;&gt;&gt;&gt;what you need (but since it doesn&#39;t build any=
thing, there is<br>
&gt; &gt; &gt;&gt;&gt;&gt;no abi .. and no modules can be built against it)=
 .. so the<br>
&gt; &gt; &gt;&gt;&gt;&gt;error isn&#39;t graceful.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;Bruce<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;I can confirm this same problem is happening to me.=
=C2=A0 I just updated<br>
&gt; &gt; &gt;&gt;&gt;one of my builds from 1.7 to 1.8 and am also getting =
my rootfs to fail<br>
&gt; &gt; &gt;&gt;&gt;due to no abi kernel version:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;We still have a race condition in the 1.8 branch for the =
population<br>
&gt; &gt; &gt;&gt;of the build-artifacts directory.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;If modules start building, they&#39;ll race against the p=
opulation of the<br>
&gt; &gt; &gt;&gt;abiversion, and you may see that message.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;There&#39;s a proposed patch for master, but I don&#39;t =
think it is in<br>
&gt; &gt; &gt;&gt;fido yet.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;Bruce<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;Hi Bruce,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;I did some searches and looks like there are a number of &#39=
;race&#39;<br>
&gt; &gt; &gt;condition fixes but it wasn&#39;t obvious which one I may nee=
d.=C2=A0 Is it<br>
&gt; &gt; &gt;this one:<br>
&gt; &gt; &gt;<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/com=
mit/?id=3D02d0a003d603266114512160b209876199241e98">http://git.yoctoproject=
.org/cgit/cgit.cgi/poky/commit/?id=3D02d0a003d603266114512160b209876199241e=
98</a><br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s the one that should make sure that the shared workdir<=
br>
&gt; &gt; (Which has the abiversion) is in place before building any module=
s.<br>
&gt; &gt;<br>
&gt; &gt; I can&#39;t say that it is exactly your issue, but it is the chan=
ge<br>
&gt; &gt; I was thinking of.<br>
&gt;<br>
&gt; Brian,<br>
&gt;<br>
&gt; Were you able to try the above mentioned commit against am180x in meta=
-ti? Did<br>
&gt; it solve the missing abi kernel version? Thanks.<br>
&gt;<br>
&gt; --<br>
&gt; Denys</p>
<p dir=3D"ltr">Hi Denys,</p>
<p dir=3D"ltr">No, I got caught up in something else ... I&#39;ll try it to=
morrow and report back after I cherry pick that commit Bruce mentioned.</p>
<p dir=3D"ltr">Regards,</p>
<p dir=3D"ltr">Brian<br>
</p>

--001a113d57967ae0990516121582--
