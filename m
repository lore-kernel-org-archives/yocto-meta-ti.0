Return-Path: <otavio.salvador@gmail.com>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3DF5E00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:38:21 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by faao14 with SMTP id o14so1060089faa.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=/WC5YG8aGF+vQlLhxFIfDFWZv8ZaLYNKmu2hcRLZXGg=;
	b=OaXu0vWj8sKxMHVYPqFFfvmue18fI63RHzfbp+ecBEcnfpdWVb1MplJ0r79rKNK8G1
	CAtuYdVDQ/VQNOxrxDlGw8SqsnWjtb3j4DwCMRnEyLC9YQS8tNmzDNt3Mkxd2F+ZMIa5
	YWg03GP3HGbCXHFpZqfVmpYpTLn9YA+W9nimY=
MIME-Version: 1.0
Received: by 10.205.83.73 with SMTP id af9mr50702344bkc.24.1322573900405; Tue,
	29 Nov 2011 05:38:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Tue, 29 Nov 2011 05:38:20 -0800 (PST)
In-Reply-To: <4ED4DEF2.2000705@ti.com>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
Date: Tue, 29 Nov 2011 11:38:20 -0200
X-Google-Sender-Auth: 5HzzjL0HsUjBMVEBANNTkufHagU
Message-ID: <CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: William Mills <wmills@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Tue, 29 Nov 2011 13:38:22 -0000
Content-Type: multipart/alternative; boundary=bcaec554016a85dbdf04b2dfbbf0

--bcaec554016a85dbdf04b2dfbbf0
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 29, 2011 at 11:32, William Mills <wmills@ti.com> wrote:
>
> On 11/29/2011 08:22 AM, Koen Kooi wrote:
>>
>> Op 29 nov. 2011, om 13:53 heeft Otavio Salvador het volgende geschreven:
>>
>>> On Tue, Nov 29, 2011 at 10:41, Otavio Salvador<otavio@ossystems.com.**br<otavio@ossystems.com.br>>
>>>  wrote:
>>> ...
>>> +# Copyright (C) 2011 O.S. Systems Software LTDA.
>>> +#
>>> +# Create an image that can by written onto a SD card using dd.
>>> +#
>>> +# External variables needed:
>>> +#   ${ROOTFS} - the rootfs image to incorporate
>>>
>>> I added Joel in copyright noticed as he did the first version of it. You
>>> can look at https://github.com/OSSystems/**meta-ti/commit/**
>>> cc8f9eeb2e73c77cdb24f8d8eb2398**ea12d660b3<https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398ea12d660b3>
>>>
>>
>> And I wrote the original and then rewrote Joels version. So lets leave
>> out any copyright statement from the class.
>>
>>
> A copyright notice in a file without an explicit statement of license (in
> the same file) should always be rejected as it will cause major problems
> with all license review processes (including TI's).
>
> I agree with Koen that it is best to just drop the (c) notice.
>

No problem; I will wait for more comments and do that for a v3 version.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec554016a85dbdf04b2dfbbf0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Nov 29, 2011 at 11:32, William Mills <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:wmills@ti.com">wmills@ti.com</a>&gt;</=
span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"HOEnZb"><div class=3D"h5">
On 11/29/2011 08:22 AM, Koen Kooi wrote:<blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Op 29 nov. 2011, om 13:53 heeft Otavio Salvador het volgende geschreven:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, Nov 29, 2011 at 10:41, Otavio Salvador&lt;<a href=3D"mailto:otavio@=
ossystems.com.br" target=3D"_blank">otavio@ossystems.com.<u></u>br</a>&gt; =
=A0wrote:<br>
...<br>
+# Copyright (C) 2011 O.S. Systems Software LTDA.<br>
+#<br>
+# Create an image that can by written onto a SD card using dd.<br>
+#<br>
+# External variables needed:<br>
+# =A0 ${ROOTFS} - the rootfs image to incorporate<br>
<br>
I added Joel in copyright noticed as he did the first version of it. You ca=
n look at <a href=3D"https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e=
73c77cdb24f8d8eb2398ea12d660b3" target=3D"_blank">https://github.com/OSSyst=
ems/<u></u>meta-ti/commit/<u></u>cc8f9eeb2e73c77cdb24f8d8eb2398<u></u>ea12d=
660b3</a><br>

</blockquote>
<br>
And I wrote the original and then rewrote Joels version. So lets leave out =
any copyright statement from the class.<br>
<br>
</blockquote>
<br></div></div>
A copyright notice in a file without an explicit statement of license (in t=
he same file) should always be rejected as it will cause major problems wit=
h all license review processes (including TI&#39;s).<br>
<br>
I agree with Koen that it is best to just drop the (c) notice.<br>
</blockquote></div><br>No problem; I will wait for more comments and do tha=
t for a v3 version.<br clear=3D"all"><div><br></div>-- <br>Otavio Salvador=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>=
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--bcaec554016a85dbdf04b2dfbbf0--
