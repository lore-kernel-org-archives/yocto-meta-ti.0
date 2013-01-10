Return-Path: <twoerner@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D64D2E00720
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 15:01:54 -0800 (PST)
Received: by mail-we0-f175.google.com with SMTP id z53so559467wey.20
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OtNww+dTvCh88JnYE4qHr4epEskXGnaiVHijZKk42Rc=;
	b=rIZQ9sXPLwwJSlGjWN/IgOTHZ7xuFGYppUPbzxDF8FjAl88Ix66YH8POMpo5TXxXaN
	t35kKhCdHD3SOU2DtWIkLLm1Key6PSuxwwp/LXJfJ4ICZM6iKAGpmMPdJFtlmsl+pm1P
	bVsrAjDmhF+71VIDhcACUM6qkgt0z2J8MiTyPR5cu67ySrcoMuLkI2jnszBbsJjXzXRn
	Nr0aKYDlY5FY6bfr3FMGMgGHlGy7pp1ySMcOJsWaKsmg/WgDSwhif9u0lGG8U9rXc2CI
	BrkEmewdWW6F8bye0t5orIzkLCKObrBCCG0BlqPfXpwadiLLqva5ypI68SVHudjjpVJs
	mcng==
MIME-Version: 1.0
Received: by 10.194.19.10 with SMTP id a10mr117214949wje.45.1357858914065;
	Thu, 10 Jan 2013 15:01:54 -0800 (PST)
Received: by 10.227.132.205 with HTTP; Thu, 10 Jan 2013 15:01:53 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301101008200.7994@oneiric>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<alpine.DEB.2.02.1301101008200.7994@oneiric>
Date: Thu, 10 Jan 2013 18:01:53 -0500
Message-ID: <CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti@yoctoproject.org
Subject: Re: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Thu, 10 Jan 2013 23:01:55 -0000
Content-Type: multipart/alternative; boundary=047d7b5d48083a5eb004d2f72ac2

--047d7b5d48083a5eb004d2f72ac2
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 10, 2013 at 10:11 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:
>> > ===== start =====
>> > ... big snip ...
>> > | /etc/fstab entries need to be created with the user flag for the
>> > loop devices like:
>> > | /dev/loop2
>> >
/home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/tmp-mnt-boot
>> > vfat user 0 0

>   i'm going to be testing all of the above again shortly from scratch
> to make sure it wasn't something silly i did.  but if someone wants to
> see if they can reproduce it, all i did was a standard configure using
> meta-ti layer for a beaglebone and i built a core-image-minimal.


I followed the same procedure and met the same end.

I was able to get the build to complete without error (NOTE: i don't own
this
device, so i can't be sure it all worked, but the build completed) with the
help of the following:

1) edit /etc/fstab

The build is telling you to update your /etc/fstab (which you have to do as
root, and which is very *this*-build-specific. In your case it wants you to
add the following line:

    /dev/loop2
/home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/tmp-mnt-boot
vfat user 0 0

2) path fixup

I'm building using openSuSE 12.2 so all the various hard-coded paths in the
script are wrong. Instead of "/sbin/fsdisk" mine is found at
"/usr/sbin/fsdisk".
I had to go through the entire script and perform that fixup for all such
paths.

3) genext2fs code hack

Within 5 yards of finish line the 'genext2fs' step fails with the following
error msg:

  genext2fs: set_file_size: ftruncate: Invalid argument

I googled and googled and couldn't find an answer. I found other people
with the
same problem, but others only said "works for me". In the end I actually
went
into the code of genext2fs and commented out the body of the
"set_file_size()"
function! I then replaced the one being called by the script with my new
one and
the build could then complete without error.

4) use the "root"

As I mentioned before, this script's use of losetup definitely requires root
permissions on my system. At first I made losetup "+s". Then sfdisk needed
more permissions, then dd, then... In the end I just simply ran bitbake as
root.
Of course, by default, bitbake complains and won't run as root, so I had to
"touch conf/sanity.conf" to force it.

After all these hacks (and maybe more?) I was able to get the build to
complete without
error. Whether or not the results are useful I'm not sure. In the end I
ended up with the
following artifact:


tmp/deploy/images/core-image-minimal-beagleboard-20130110215340-2013.01.10.img.gz

--047d7b5d48083a5eb004d2f72ac2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div><div><di=
v><div><div><div>On Thu, Jan 10, 2013 at 10:11 AM, Robert P. J. Day &lt;<a =
href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<=
br>
&gt;&gt; &gt; =3D=3D=3D=3D=3D start =3D=3D=3D=3D=3D<br>&gt;&gt; &gt; ... bi=
g snip ...<br>&gt;&gt; &gt; | /etc/fstab entries need to be created with th=
e user flag for the<br>&gt;&gt; &gt; loop devices like:<br>&gt;&gt; &gt; | =
/dev/loop2<br>&gt;&gt; &gt; /home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/=
beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/tmp-mnt-boot<br>
&gt;&gt; &gt; vfat user 0 0<br><br>&gt; =A0 i&#39;m going to be testing all=
 of the above again shortly from scratch<br>&gt; to make sure it wasn&#39;t=
 something silly i did. =A0but if someone wants to<br>&gt; see if they can =
reproduce it, all i did was a standard configure using<br>
&gt; meta-ti layer for a beaglebone and i built a core-image-minimal.<br><b=
r><br>I followed the same procedure and met the same end.<br><br>I was able=
 to get the build to complete without error (NOTE: i don&#39;t own this<br>
device, so i can&#39;t be sure it all worked, but the build completed) with=
 the<br>help of the following:<br><br></div>1) <span class=3D""></span><spa=
n class=3D""></span>edit /etc/fstab<br><br></div>The build is telling you t=
o update your /etc/fstab (which you have to do as<br>
root, and which is very *this*-build-specific. In your case it wants you to=
<br>add the following line:<br><br>=A0=A0=A0 /dev/loop2=A0=A0=A0 /home/rpjd=
ay/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image=
-minimal/1.0-r0/tmp-mnt-boot=A0 vfat user 0 0<br>
<br></div>2) path fixup<br><br></div>I&#39;m building using openSuSE 12.2 s=
o all the various hard-coded paths in the<br>script are wrong. Instead of &=
quot;/sbin/fsdisk&quot; mine is found at &quot;/usr/sbin/fsdisk&quot;.<br>
I had to go through the entire script and perform that fixup for all such p=
aths.<br><br></div>3) genext2fs code hack<br><br></div>Within 5 yards of fi=
nish line the &#39;genext2fs&#39; step fails with the following error msg:<=
br>
<br>=A0 genext2fs: set_file_size: ftruncate: Invalid argument<br><br></div>=
I googled and googled and couldn&#39;t find an answer. I found other people=
 with the<br>same problem, but others only said &quot;works for me&quot;. I=
n the end I actually went<br>
</div>into the code of genext2fs and commented out the body of the &quot;se=
t_file_size()&quot;<br></div>function! I then replaced the one being called=
 by the script with my new one and<br></div>the build could then complete w=
ithout error.<br>
<br></div>4) use the &quot;root&quot;<br><br></div>As I mentioned before, t=
his script&#39;s use of losetup definitely requires root<br>permissions on =
my system. At first I made losetup &quot;+s&quot;. Then sfdisk needed<br>
more permissions, then dd, then... In the end I just simply ran bitbake as =
root.<br>Of course, by default, bitbake complains and won&#39;t run as root=
, so I had to<br></div>&quot;touch conf/sanity.conf&quot; to force it.<br>
<br></div>After all these hacks (and maybe more?) I was able to get the bui=
ld to complete without<br>error. Whether or not the results are useful I&#3=
9;m not sure. In the end I ended up with the<br>following artifact:<br>
<br></div>=A0 tmp/deploy/images/core-image-minimal-beagleboard-201301102153=
40-2013.01.10.img.gz<br></div>

--047d7b5d48083a5eb004d2f72ac2--
