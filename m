Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D01F4E01423
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 12:42:49 -0800 (PST)
Received: by mail-vc0-f176.google.com with SMTP id fl13so7972473vcb.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 12:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1PgBloQn4zOfYYx7/D41ka8FHCdSrazok7bwjkF+pFQ=;
	b=mKfdHV5r4h3lUCrDbSDilKLHp60Bnne61MP2Rm033hv4paVH5+WjsbHYQPc5YzYGEc
	8yo/7zEIx/BoYyTe+Qi/mddqLQ19klMNIJgOqDC/5yUbtCldzHLFZJw9TPxC43Ve1FWD
	+7AfaYxgma3VVkRPVtkDPnycyqfkOHzQ9W+F0qMsSPIziGwisPceMai1EZwqv0hHM1I+
	fdkCVgvUyQ7UAtN+pY0hW8Rql9mBBBRNDoP+lU8Paz78Rs1wE0CqW84Wis6X56Lv5qK2
	TF7eklBgCldBljMZIWunNE5JbjOkfaUWtBpNCbWKXnRrOFTBVUKXKko41lzKSbiun/BU
	aAsQ==
MIME-Version: 1.0
Received: by 10.58.198.135 with SMTP id jc7mr25763988vec.51.1353444168944;
	Tue, 20 Nov 2012 12:42:48 -0800 (PST)
Received: by 10.58.248.74 with HTTP; Tue, 20 Nov 2012 12:42:48 -0800 (PST)
Received: by 10.58.248.74 with HTTP; Tue, 20 Nov 2012 12:42:48 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1211201419330.18808@oneiric>
References: <alpine.DEB.2.02.1211201419330.18808@oneiric>
Date: Tue, 20 Nov 2012 21:42:48 +0100
Message-ID: <CAOT3miKf4+VAc8cVRRd0-xoHosXBf0xJ38Sb5-cDST0JcriAzw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: there *is* no libdrm_2.4.39 in oe-core anymore, it's now 2.4.40
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
X-List-Received-Date: Tue, 20 Nov 2012 20:42:50 -0000
Content-Type: multipart/alternative; boundary=047d7b5d8cd7e9cc6304cef34622

--047d7b5d8cd7e9cc6304cef34622
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 20 nov. 2012 20:21, "Robert P. J. Day" <rpjday@crashcourse.ca> a =E9crit=
 :
>
>
>   only 5 days ago, oe-core upgraded libdrm to 2.4.40, so the recent
> meta-ti addition of libdrm_2.4.39.bbappend doesn't really do much
> good.

Yes. That is what i reported earlier today. And that's why we discussed
that we need to create the danny branch in meta-ti since danny still uses
libdrm 2.39.

Once we create danny branch we can revert the libdrm bbappend commit in
master (and xf86-video-omap as well since it was merged in oe-core too)

>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--047d7b5d8cd7e9cc6304cef34622
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
Le 20 nov. 2012 20:21, &quot;Robert P. J. Day&quot; &lt;<a href=3D"mailto:r=
pjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; a =E9crit=A0:<br>
&gt;<br>
&gt;<br>
&gt; =A0 only 5 days ago, oe-core upgraded libdrm to 2.4.40, so the recent<=
br>
&gt; meta-ti addition of libdrm_2.4.39.bbappend doesn&#39;t really do much<=
br>
&gt; good.</p>
<p>Yes. That is what i reported earlier today. And that&#39;s why we discus=
sed that we need to create the danny branch in meta-ti since danny still us=
es libdrm 2.39.</p>
<p>Once we create danny branch we can revert the libdrm bbappend commit in =
master (and xf86-video-omap as well since it was merged in oe-core too)</p>
<p>&gt;<br>
&gt; rday<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 Ottawa, Ontario, CANADA<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a href=3D"http://cras=
hcourse.ca">http://crashcourse.ca</a><br>
&gt;<br>
&gt; Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday">http://twitter.com/rp=
jday</a><br>
&gt; LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
<a href=3D"http://ca.linkedin.com/in/rpjday">http://ca.linkedin.com/in/rpjd=
ay</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
</p>

--047d7b5d8cd7e9cc6304cef34622--
