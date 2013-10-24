Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D49C2E0175F
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 05:14:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9OCEJ2F029008;
	Thu, 24 Oct 2013 07:14:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9OCEJgE017726;
	Thu, 24 Oct 2013 07:14:19 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 24 Oct 2013 07:14:19 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "gary@mlbassoc.com" <gary@mlbassoc.com>, "schnitzeltony@googlemail.com"
	<schnitzeltony@googlemail.com>
Thread-Topic: [meta-ti] [PATCH] mesa appends: remove PROVIDES
Thread-Index: AQHO0JudvYEtme+8VUOoZCBDqMP9LZoECXEAgAAHYAD//7MY2Q==
Date: Thu, 24 Oct 2013 12:14:18 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E906A57@DLEE08.ent.ti.com>
References: <1382606978-9914-1-git-send-email-schnitzeltony@googlemail.com>
	<5269031E.4040504@mlbassoc.com>,
	<CALbNGRQHT73Zg4u+4b7sg8AONfxy--hsXoPejz2sY8pthX-T_Q@mail.gmail.com>
In-Reply-To: <CALbNGRQHT73Zg4u+4b7sg8AONfxy--hsXoPejz2sY8pthX-T_Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mesa appends: remove PROVIDES
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
X-List-Received-Date: Thu, 24 Oct 2013 12:14:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E906A57DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E906A57DLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, I'll have to look at it once I'm back from ELCE...


Denys


-----Original Message-----
From: Andreas M=FCller [schnitzeltony@googlemail.com]
Received: Thursday, 24 Oct 2013, 12:49
To: Gary Thomas [gary@mlbassoc.com]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] [PATCH] mesa appends: remove PROVIDES

On Thu, Oct 24, 2013 at 1:23 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2013-10-24 03:29, Andreas M=FCller wrote:
>>
>> These came in when mesa was reworked. Nowadays they are useless and what
>> they try to do achieve is wrong: provider for virtual/libgsl should be
>> mesa-gl. The appends were left in to avoid backward revision trouble in
>> package feeds.
>
>
> If this is the correct solution, I think these .bbappend files should be
> removed completely.  They don't change anything and keeping them just to
> retain the PRINC is useless because as is one cannot even build a system
> which uses virtual/mesa, e.g. one using the X11 server.  In addition, the
> main mesa recipe is about to be updated so they'll need changing again ve=
ry
> soon.
>
So let's kick them out as soon as mesa is updated

Andreas
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE72E906A57DLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Thanks, I'll have to look at it once I'm back from ELCE...=
<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Andreas M=FCller [schnitzeltony@googlemail.com]<br>
<b>Received:</b> Thursday, 24 Oct 2013, 12:49<br>
<b>To:</b> Gary Thomas [gary@mlbassoc.com]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] [PATCH] mesa appends: remove PROVIDES<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Thu, Oct 24, 2013 at 1:23 PM, Gary Thomas &lt;g=
ary@mlbassoc.com&gt; wrote:<br>
&gt; On 2013-10-24 03:29, Andreas M=FCller wrote:<br>
&gt;&gt;<br>
&gt;&gt; These came in when mesa was reworked. Nowadays they are useless an=
d what<br>
&gt;&gt; they try to do achieve is wrong: provider for virtual/libgsl shoul=
d be<br>
&gt;&gt; mesa-gl. The appends were left in to avoid backward revision troub=
le in<br>
&gt;&gt; package feeds.<br>
&gt;<br>
&gt;<br>
&gt; If this is the correct solution, I think these .bbappend files should =
be<br>
&gt; removed completely.&nbsp; They don't change anything and keeping them =
just to<br>
&gt; retain the PRINC is useless because as is one cannot even build a syst=
em<br>
&gt; which uses virtual/mesa, e.g. one using the X11 server.&nbsp; In addit=
ion, the<br>
&gt; main mesa recipe is about to be updated so they'll need changing again=
 very<br>
&gt; soon.<br>
&gt;<br>
So let's kick them out as soon as mesa is updated<br>
<br>
Andreas<br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E906A57DLEE08entticom_--
