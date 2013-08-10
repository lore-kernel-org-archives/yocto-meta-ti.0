Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3819E00406
	for <meta-ti@yoctoproject.org>; Fri,  9 Aug 2013 17:22:44 -0700 (PDT)
Received: by mail-oa0-f41.google.com with SMTP id j6so7769500oag.28
	for <meta-ti@yoctoproject.org>; Fri, 09 Aug 2013 17:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0ObF0woAXwN6oxz/B3di3x50R/XREaP2buNSLk0gSP4=;
	b=Xmqvl+5ozkrsbXo2kAetoVV+UhSqvFbOH/gHCx5VyBC7J2kLAQUk2H8bJ63kxiI6TV
	FSlNswhAUOgxwvVZfWCQ4PlIPdgnoaQXXTO7M+Jrb/gdDn3w0hQ93Nbnf7btNfJfzK8z
	zn6O5ofMbx1nCXwmJuZj6pFbevpnQu3IitS4HxnBKY4d1SYIrgFJMtKVdxPNaKBw3Qtb
	glwI3ayYVHCyWIayuQHlACAfNOcsWa9hw7eHHn3N/k2etHv4WquvBL7rnZEIWAWIYJ5j
	S7cobEyFdFGszPwWzh0P1Zg9SlMUWPewA1L4FwksTCMdUF36wRIlRpY4OKQtceJMhv0N
	mT9Q==
MIME-Version: 1.0
X-Received: by 10.182.129.17 with SMTP id ns17mr2473132obb.13.1376094164375;
	Fri, 09 Aug 2013 17:22:44 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 9 Aug 2013 17:22:44 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 9 Aug 2013 17:22:44 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1308091920590.10592@oneiric>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
Date: Fri, 9 Aug 2013 20:22:44 -0400
Message-ID: <CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Sat, 10 Aug 2013 00:22:46 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1fbb0d85d5e04e38ce3b8

--e89a8fb1fbb0d85d5e04e38ce3b8
Content-Type: text/plain; charset=ISO-8859-1

On Aug 9, 2013 7:23 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
>
>   trying to build for beaglebone, getting:
>
> ERROR: No recipes available for:
>
/home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.1.5.bbappend
> ERROR: Command execution failed: Exited with 1
>
> should meta-ti master stay in sync with oe-core master (which has a
> recipe for 9.1.6), or is there a different combo of layers to use?
> thanks.
>
> rday
>

Hi Robert,

I ran into the same thing the other day.  Yes, yocto master should be used
with meta-ti master as far as I know.  I've ran into trouble mixing branch
layers before.

My problem happened after I did a git pull on everything.  I also had other
problems besides the one you mentioned.  I suspect the update messed
something up as I did another checkout of yocto master and meta-ti master
and had a clean build.  Makes me suspect something in the git pull that
hosed something up.

Regards,

Brian

--e89a8fb1fbb0d85d5e04e38ce3b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 9, 2013 7:23 PM, &quot;Robert P. J. Day&quot; &lt;<a href=3D"mailto:=
rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; =A0 trying to build for beaglebone, getting:<br>
&gt;<br>
&gt; ERROR: No recipes available for:<br>
&gt; /home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.1.5.b=
bappend<br>
&gt; ERROR: Command execution failed: Exited with 1<br>
&gt;<br>
&gt; should meta-ti master stay in sync with oe-core master (which has a<br=
>
&gt; recipe for 9.1.6), or is there a different combo of layers to use?<br>
&gt; thanks.<br>
&gt;<br>
&gt; rday<br>
&gt;</p>
<p dir=3D"ltr">Hi Robert,</p>
<p dir=3D"ltr">I ran into the same thing the other day.=A0 Yes, yocto maste=
r should be used with meta-ti master as far as I know.=A0 I&#39;ve ran into=
 trouble mixing branch layers before.</p>
<p dir=3D"ltr">My problem happened after I did a git pull on everything.=A0=
 I also had other problems besides the one you mentioned.=A0 I suspect the =
update messed something up as I did another checkout of yocto master and me=
ta-ti master and had a clean build.=A0 Makes me suspect something in the gi=
t pull that hosed something up.</p>

<p dir=3D"ltr">Regards,</p>
<p dir=3D"ltr">Brian</p>

--e89a8fb1fbb0d85d5e04e38ce3b8--
