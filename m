Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BB89E00406
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 13:13:25 -0700 (PDT)
Received: by mail-ob0-f181.google.com with SMTP id dn14so4625511obc.12
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wHVojcn+efTXeL6DxGyIQ30Xhl3buFN/LI4O78nl1E4=;
	b=PmKr2mND3WT0uoXjh3dUPQnTjBgBXCRt4jf7iBmvJyXu+Jz0zE1Ef9zzf01y+UQUPV
	x/+JcioQT0eCqyRw25UWoP/BuISoTZsXP6xoI3F20j0C7mzrs6hxQRqONJjK/c7pfz70
	LQM/f7fzGnRFVEQxzhdMaukRX6yotfNy4BQl/KksheuooBEXa3sx2EBeoXkGSmLPE49f
	hXB9AXBhisnhKH5C/c9RXTRmhEa54mu8Hd9PfdC5LYvNfIfb1NbS6I1JxETxy4eYJyYa
	pLKWS3BaxM5n3BRPJqP4UZ/yQzRp6B7OflMcefUvgKNQxeAHJ8S3hcF9UezWJ21yQYku
	/lZA==
MIME-Version: 1.0
X-Received: by 10.182.53.234 with SMTP id e10mr16127318obp.47.1377202405240;
	Thu, 22 Aug 2013 13:13:25 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 22 Aug 2013 13:13:25 -0700 (PDT)
In-Reply-To: <CAFZh4h-e9iusAaQbbijZ4o4JpQ+4d_YdmJBe=E0zRU6i9m9ZKw@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
	<20130822024616.GA25063@edge>
	<CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
	<CAFZh4h8avM4+=5zDuB_6N4bJL5jLKaUPSi8VK66d1+NunaZx+w@mail.gmail.com>
	<20130822185445.GD25749@edge>
	<CAFZh4h-e9iusAaQbbijZ4o4JpQ+4d_YdmJBe=E0zRU6i9m9ZKw@mail.gmail.com>
Date: Thu, 22 Aug 2013 16:13:25 -0400
Message-ID: <CAFZh4h8jhBFkeO9jF_zuCmvxcnwepbxqtVyprBOOvCVg40_hOA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 22 Aug 2013 20:13:26 -0000
Content-Type: multipart/alternative; boundary=001a11c1c00c25f58204e48eec81

--001a11c1c00c25f58204e48eec81
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 3:35 PM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

>
>>
>> You need something like this:
>>
>>
>> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=61162abba3aa56057dfdfa8ae3a93c281aa2342a
>>
>> There's no standard variable LINUX_LIBC_HEADERS_VERSION for that, AFAIK.
>>
>>
> Ah, thanks for the heads up.  I looked at my arago checkout and my
> arago-prefs.inc didn't look like that but I see you just did that a few
> days ago so I'll do a git pull and update my tree and study that to figure
> out how it works.
>
> So for my particular case, I'm guessing I need to do something similar
> in oe-core/meta/conf/distro/include/default-providers.inc
> & default-versions.inc?
>
> Regards,
>
> Brian
>
>
I see said the blind man!  I put PREFERRED_VERSION_linux-libc-headers ?=
"2.6.37.2"  in my default-versions.inc file and I see some action going on
now! :)

Thanks!

Regards,

Brian

--001a11c1c00c25f58204e48eec81
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 22, 2013 at 3:35 PM, Brian Hutchinson <span di=
r=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.h=
utchman@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"=
gmail_quote">
<div class=3D"im"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div><br><br>
</div>You need something like this:<br>
<br>
<a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;=
h=3D61162abba3aa56057dfdfa8ae3a93c281aa2342a" target=3D"_blank">http://arag=
o-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3D61162abba3aa56057d=
fdfa8ae3a93c281aa2342a</a><br>


<br>
There&#39;s no standard variable LINUX_LIBC_HEADERS_VERSION for that, AFAIK=
.<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div><br></div=
></div><div>Ah, thanks for the heads up. =A0I looked at my arago checkout a=
nd my arago-prefs.inc didn&#39;t look like that but I see you just did that=
 a few days ago so I&#39;ll do a git pull and update my tree and study that=
 to figure out how it works.=A0</div>

<div><br></div><div>So for my particular case, I&#39;m guessing I need to d=
o something similar in=A0oe-core/meta/conf/distro/include/default-providers=
.inc &amp;=A0default-versions.inc?</div><div><br></div><div>Regards,</div>
<div>
<br></div><div>Brian</div><div><br></div></div></div></div></blockquote><di=
v><br></div><div>I see said the blind man! =A0I put PREFERRED_VERSION_linux=
-libc-headers ?=3D &quot;2.6.37.2&quot; =A0in my default-versions.inc file =
and I see some action going on now! :) =A0</div>
<div><br></div><div>Thanks!</div><div><br></div><div>Regards,</div><div><br=
></div><div>Brian</div></div></div></div>

--001a11c1c00c25f58204e48eec81--
