Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE4E5E0078A
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 11:49:02 -0800 (PST)
Received: by mail-qa0-f47.google.com with SMTP id j5so12268097qaq.20
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 11:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fvt42uUBMVZmCAyyNVlT8AbzVxP9yT6lz1TJce42UNI=;
	b=eg+Yg255ErGFD3JkgeVdsa9GvHXywHJYssQb9KVxBiFFfWmPxCudKwizQqojR/OU6H
	nD7PqF5WOucPvNcc8Rrn8dDg6K/PTsAK/KTpPWYPaXaVBqqoWNrDjwjiXW3cv7bmCZJJ
	O+N6nJzdgQU8SQYCEcmGcPZLEJrJNwGFXAJv6zbkd6GF5zQH22bwb8rLQtgPJTITQ/zM
	Q1KxaMTR/ar7jE0phUQc1j+gS1BFTj5IxKR0OEDNyusNncWDpYVlKZpEfXOw6Mmfux0S
	55F8XWjU6O32trl95YEib5Q7D1QHG++qFQMudEZ0y7UuYvX0ftaBQahracsAO3dvnb+P
	q45Q==
X-Received: by 10.140.91.198 with SMTP id z64mr6956166qgd.32.1392148141662;
	Tue, 11 Feb 2014 11:49:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 11:48:41 -0800 (PST)
In-Reply-To: <CAEaGWU+V5yCb9NhfQdVGLyURminS5rjJU0YF+2GAEiu9ob2HDA@mail.gmail.com>
References: <CAEaGWUJAg_OuSLwy9rBy3q5VjRiO9UrA1zNdnKqG_f7=UDYY0w@mail.gmail.com>
	<CAMCfZKHrfLX7C22ZkUKUMyXhe0+nmHRzwPwmUD1C9LD-W-dj4g@mail.gmail.com>
	<CAEaGWUJ3L2aQoiZco-81-9YnGULWtDHXbz8N=N25H+4jreqpqQ@mail.gmail.com>
	<CAMCfZKFU=7yot-k5SXOBgGXspOtn+ePdby6O4UkJ4R34Hk_XtQ@mail.gmail.com>
	<CAEaGWU+V5yCb9NhfQdVGLyURminS5rjJU0YF+2GAEiu9ob2HDA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 17:48:41 -0200
Message-ID: <CAMCfZKH9o4iMdmWTMBY9785yF9j15v6YgXsHTyqfTOreSeHqcg@mail.gmail.com>
To: Fabio Berton <fbberton@gmail.com>,
	meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Cape manager Beaglebone Black
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
X-List-Received-Date: Tue, 11 Feb 2014 19:49:06 -0000
Content-Type: multipart/alternative; boundary=001a113a2cae75683004f226bf36

--001a113a2cae75683004f226bf36
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Fabio,

Please reply to meta-ti mailing list to keep track.


On Tue, Feb 11, 2014 at 5:31 PM, Fabio Berton <fbberton@gmail.com> wrote:

> Yes, 3.12.10 kernel version. I'll try meta-beagleboard.
>
>
>
> Fabio Berton
> Engenharia de Computa=E7=E3o - UFSM
> Estagi=E1rio Chip Inside Tecnologia - ITSM
>
> E-mail: fbberton@gmail.com
> Gtalk: fbberton@gmail.com
> Tel.:  (55) 9651-4405
>
> Santa Maria - RS
>
>
> 2014-02-11 17:26 GMT-02:00 Diego Sueiro <diego.sueiro@gmail.com>:
>
>
>> On Tue, Feb 11, 2014 at 5:11 PM, Fabio Berton <fbberton@gmail.com> wrote=
:
>>
>>> I added "IMAGE_INSTALL +=3D "kernel-modules"" on my conf/local.conf and
>>> doesn't work.
>>
>>
>> Just to make sure. Are you building linux-ti-staging_3.12?
>> If I'm not wrong this kernel version doesn't support capes yet. But Deny=
s
>> can give us more details.
>>
>> You can use meta-beagleboard to build kernel 3.8 with full capes support=
:
>> https://github.com/beagleboard/meta-beagleboard/tree/master/common-bsp
>>
>>
>> Regards,
>>
>> --
>> *dS
>> Diego Sueiro
>>
>> Administrador do Embarcados
>> www.embarcados.com.br
>>
>> /*long live rock 'n roll*/
>>
>
>

--001a113a2cae75683004f226bf36
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Fabio,</div><div style><br></div><div style>Ple=
ase reply=A0to meta-ti mailing list to keep track.</div><div class=3D"gmail=
_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div><br></div></div></div>=
<div class=3D"gmail_quote">

On Tue, Feb 11, 2014 at 5:31 PM, Fabio Berton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fbberton@gmail.com" target=3D"_blank">fbberton@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">

<div dir=3D"ltr">Yes, 3.12.10 kernel version. I&#39;ll try meta-beagleboard=
.<div><br></div><div><br></div></div><div class=3D"gmail_extra"><div class=
=3D"im"><br clear=3D"all"><div><div dir=3D"ltr"><div>
<font color=3D"#666666">Fabio Berton<br></font></div><div><font color=3D"#6=
66666"><span>Engenharia de Computa=E7=E3o - UFSM</span></font></div><div><f=
ont color=3D"#666666">Estagi=E1rio Chip Inside Tecnologia - ITSM</font></di=
v><div>



<font color=3D"#666666"><br></font></div><div><font color=3D"#666666">E-mai=
l:=A0<a href=3D"mailto:fbberton@gmail.com" target=3D"_blank">fbberton@gmail=
.com</a></font></div><div><span style=3D"color:rgb(102,102,102)">Gtalk:=A0<=
a href=3D"mailto:fbberton@gmail.com" target=3D"_blank">fbberton@gmail.com</=
a></span></div>






<div><span style=3D"color:rgb(102,102,102)">Tel.:=A0 <a href=3D"tel:%2855%2=
9%209651-4405" value=3D"+15596514405" target=3D"_blank">(55) 9651-4405</a><=
br></span></div><div><font color=3D"#666666"><br></font></div><div><font co=
lor=3D"#666666">Santa Maria - RS</font></div>

</div></div>
<br><br></div><div class=3D"gmail_quote">2014-02-11 17:26 GMT-02:00 Diego S=
ueiro <span dir=3D"ltr">&lt;<a href=3D"mailto:diego.sueiro@gmail.com" targe=
t=3D"_blank">diego.sueiro@gmail.com</a>&gt;</span>:<div><div class=3D"h5"><=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">



<div dir=3D"ltr"><div class=3D"gmail_extra"><div><br><div class=3D"gmail_qu=
ote">On Tue, Feb 11, 2014 at 5:11 PM, Fabio Berton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:fbberton@gmail.com" target=3D"_blank">fbberton@gmail.com</a=
>&gt;</span> wrote:<br>





<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">I added &quot;IMAGE_INSTALL +=3D &quot;kernel-modules&quot=
;&quot; on my conf/local.conf and doesn&#39;t work.=A0</blockquote>





</div><br></div>Just to make sure. Are you building linux-ti-staging_3.12?<=
/div><div class=3D"gmail_extra">If I&#39;m not wrong this kernel version do=
esn&#39;t support capes yet. But Denys can give us more details.</div><div =
class=3D"gmail_extra">





<br></div><div class=3D"gmail_extra">You can use meta-beagleboard to build =
kernel 3.8 with full capes support:</div><div class=3D"gmail_extra"><a href=
=3D"https://github.com/beagleboard/meta-beagleboard/tree/master/common-bsp"=
 target=3D"_blank">https://github.com/beagleboard/meta-beagleboard/tree/mas=
ter/common-bsp</a></div>



<div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br>Regards=
,<br><div><div dir=3D"ltr"><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>=
Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br" tar=
get=3D"_blank">www.embarcados.com.br</a><br>





<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div></div>
</blockquote></div></div></div><br></div>
</blockquote></div><br></div></div>

--001a113a2cae75683004f226bf36--
