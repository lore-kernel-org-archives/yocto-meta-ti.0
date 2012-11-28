Return-Path: <ndec13@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99E21E00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:31:18 -0800 (PST)
Received: by mail-qa0-f41.google.com with SMTP id c26so5555701qad.14
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YJSHedDfXe6vrA7nh5L/8t8qlnU9qOfvzm6xObiRTw8=;
	b=LEXKo2wAvKAjmXu16GA4UoLqGLvWWEI6Tou5WJ2S5dXKFVrW6LDIWzOJONrrpjWEDI
	FxzqL/U7v4eExw5DkZXstUxgMjSt+B64oi8LgYYwK1lzjArl3h03DpHfwgb+xJeOqexl
	lBDxettJUSVGt5NVhPQUwj778OLYPZfqqfRSMBd76NchCkqs7y8Ci0xuqZQdl2Xb0aTZ
	58x1w/R0cKr+AipQZv1ZmOe0CPDEMaq/f6FQilptFmERVulHK2OPs+7YIpRAbyBtnRYS
	5G40UA0SjotCLaEZl+Fq8dRFKav6LW19Qdvv221sJFtFlSZFJxkHie5FFwaoVUo1DJQp
	+/UA==
MIME-Version: 1.0
Received: by 10.49.127.199 with SMTP id ni7mr24726433qeb.17.1354123877476;
	Wed, 28 Nov 2012 09:31:17 -0800 (PST)
Received: by 10.49.121.161 with HTTP; Wed, 28 Nov 2012 09:31:17 -0800 (PST)
Received: by 10.49.121.161 with HTTP; Wed, 28 Nov 2012 09:31:17 -0800 (PST)
In-Reply-To: <50B649FB.30609@mlbassoc.com>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
Date: Wed, 28 Nov 2012 18:31:17 +0100
Message-ID: <CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 17:31:18 -0000
Content-Type: multipart/alternative; boundary=047d7b6dcbd6b2e9b204cf918884

--047d7b6dcbd6b2e9b204cf918884
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 28 nov. 2012 18:28, "Gary Thomas" <gary@mlbassoc.com> a =E9crit :
>
> On 2012-11-28 10:19, Denys Dmytriyenko wrote:
>>
>> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196
>
>
> Bottom line: I should just use the latest Poky/Yocto tree?  I just update=
d
> the meta-ti(master) and the quoted patches don't seem to have been applie=
d
> (the xf86-video-omap_git.bb is still present)
>

Indeed you need to apply them for now. Denys should be merging them soon.
But a tested-by won't hurt...

>
>>
>> On Wed, Nov 28, 2012 at 10:18:10AM -0700, Gary Thomas wrote:
>>>
>>> When trying to build this recipe, I get this error:
>>>
>>> configure: error: Package requirements (xorg-server >=3D 1.3 xproto
fontsproto libdrm >=3D 2.4.36 libdrm_omap xf86driproto  randrproto
renderproto videoproto xextproto) were not met:
>>> No package 'libdrm_omap' found
>>>
>>> Where can I find this package?
>>>
>>> Thanks
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--047d7b6dcbd6b2e9b204cf918884
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
Le 28 nov. 2012 18:28, &quot;Gary Thomas&quot; &lt;<a href=3D"mailto:gary@m=
lbassoc.com">gary@mlbassoc.com</a>&gt; a =E9crit=A0:<br>
&gt;<br>
&gt; On 2012-11-28 10:19, Denys Dmytriyenko wrote:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://thread.gmane.org/gmane.linux.embedded.yocto.meta=
-ti/1196">http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196</=
a><br>
&gt;<br>
&gt;<br>
&gt; Bottom line: I should just use the latest Poky/Yocto tree? =A0I just u=
pdated<br>
&gt; the meta-ti(master) and the quoted patches don&#39;t seem to have been=
 applied<br>
&gt; (the <a href=3D"http://xf86-video-omap_git.bb">xf86-video-omap_git.bb<=
/a> is still present)<br>
&gt;</p>
<p>Indeed you need to apply them for now. Denys should be merging them soon=
. But a tested-by won&#39;t hurt...<br></p>
<p>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Nov 28, 2012 at 10:18:10AM -0700, Gary Thomas wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; When trying to build this recipe, I get this error:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; configure: error: Package requirements (xorg-server &gt;=3D 1.=
3 xproto fontsproto libdrm &gt;=3D 2.4.36 libdrm_omap xf86driproto =A0randr=
proto renderproto videoproto xextproto) were not met:<br>
&gt;&gt;&gt; No package &#39;libdrm_omap&#39; found<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Where can I find this package?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; ------------------------------------------------------------<br>
&gt; Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the<br=
>
&gt; MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world<br>
&gt; ------------------------------------------------------------<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
</p>

--047d7b6dcbd6b2e9b204cf918884--
