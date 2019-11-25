Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1044.1574709866403836937
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 11:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iq5onAVQ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: raj.khem@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA87FE00FCC; Mon, 25 Nov 2019 11:24:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.181 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C362CE00F78
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 11:24:24 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id e2so13864980qkn.5
        for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 11:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCN/fds6pAqnJfU4oYB/JlFEjF3P7Sv//gPgCGDLUgk=;
        b=iq5onAVQBs68Z6sn6WajM3Yn1axCops1Prb8S+zHAP7ACmiOUst4sX6fIg2M1UOqhg
         Ra83iTArkxF8DrrKUtHtmLAopkfWKcTPlAAuz9AIepQmxnTyYmgH+tKgbqCFK9ahXFMk
         wDpm8JlLju7SwjIMWY3eLhRzeVphCtaETXX7SdH4E03d0qqdg3PXZOprtb80OblUHsiA
         4soXfNmY5asGjpvpYt9DT4mI/7MMKZKwd5HOkQe6g4Fc6+XwnrloxHCYd0WIfS5p02r7
         TeaELOh4PcOJ5vYTF6Chd17cqJgnt7MfoweSnhKw9JyamllCTSkoWkBbsWklSHP4xGBF
         0JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCN/fds6pAqnJfU4oYB/JlFEjF3P7Sv//gPgCGDLUgk=;
        b=qs0EIvEIlk8UcVNm1GNF/jJrwkafXftOpBp749hhtUnRUR5Vfabgglxs6R7G6hB62a
         b/SeU5OBp/UukCUTw6fqmBdYPoeEo0yBwh3cw6SpIzLDlF935GyfHyvC1zPI/T0fR3/I
         TkDAbkGgkQ0UBV3ky1KZPb2i1bfrcujMqd4IAZjcvrRQw4fBIb6hcKHTrUC96uF0Ebmc
         xThkQj1P9aEzeKWSss2/uOFoRT0fzRDjPVFzGt1XcSVAbRhqK2VOhms59DC4VS0Pq4Xu
         yLbtMb56N/r+8if6Y5gSTSPDVBDyk6Iz/WXHrX1QZpSegIfJCSRS7NbT2ccTKMKSKuu/
         yKSg==
X-Gm-Message-State: APjAAAXB/0lcCMmlHOYe6UO11ufz+8tioDwQu4YumPJ/EpkChHw74QRg
	qO8XBoqAuLdbWj/oKJSBthJn2NG+eiEELvQFPsOhLMKa
X-Google-Smtp-Source: APXvYqw+j42s2rY28R/x08Z2mkdZSSoLyMUOm9Kfuay4QS42AlGjUbQRLdNV/49Evn3VtMp+WKgNMvNt7e8oXkuKLT8=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr21834911qke.9.1574709863591;
 Mon, 25 Nov 2019 11:24:23 -0800 (PST)
MIME-Version: 1.0
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com> <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
 <20191125174203.GC4706@beryl> <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
 <CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com> <c7b182ec-858d-43b2-7caf-9f12a7fe67d6@ti.com>
In-Reply-To: <c7b182ec-858d-43b2-7caf-9f12a7fe67d6@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 25 Nov 2019 11:24:12 -0800
Message-ID: <CAMKF1spOAJ5fA2DZqra_VCB9HwGTijVuFuhifCTh1yRtZXEJ2g@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>, meta-ti@yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000b32ea059830b619"

--0000000000000b32ea059830b619
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ideally I agree it=E2=80=99s best to have per component git repos
But traditional SDKs have been monolithic

On Mon, Nov 25, 2019 at 10:50 AM Jacob Stiffler <j-stiffler@ti.com> wrote:

>
> On 11/25/2019 1:16 PM, Khem Raj wrote:
>
> On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <j-stiffler@ti.com> <j-st=
iffler@ti.com> wrote:
>
> On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
>
> On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
>
> On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
>
> Recently individual components and LLD sources have been combined
> into a single PDK repo. Use this class to specify the common source.
> Also use this class to keep the sources separate from each other when
> building. This keeps the build identical to previous recipes while
> keeping control on interdependencies.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com> <j-stiffler@ti.com>
> ---
>
> ...
>
> +# Extract only required sources from PDK
> +python do_unpack_append() {
> +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> +        import subprocess
> +
> +        src =3D
> os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
> PATH'))
> +
> +        # Package up only the required sources
> +        cmd =3D 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
> d.getVar('S'))
> +        subprocess.check_output(cmd, shell=3DTrue,
> stderr=3Dsubprocess.STDOUT)
> +
> +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=3DTrue)
> +}
>
> perhaps looking in work-shared idea from kernel or gcc or clang
> packages could make it better where, you only untar sources once
>
> Jake,
>
> Any updates on this - will you be looking into the above suggestion?
>
> I had originally considered this approach, but decided against it so
> that there would be no way a recipe could access other sources in the
> pdk.git.
>
> It may be a bit paranoid, but the work-shared approach would make the
> entire pdk sources available through a ti-pdk-fetch variable. I wanted
> it so that the entire pdk.git will never be unpacked in its entirety.
>
> disk operations are not cheap, so you could save a lot by
> having a monorepo. Is it due to access perms ? then its a single
> tarballs you cant have ACLs. I am still not convinced if monorepo
> approach has downsides, plus its a known approach elsewhere so
> will be easy on users.
>
> We wanted to have this safety net to make sure that this pdk.git does not
> end up as spaghetti code. So this method was devised to ensure that only =
a
> single component's sources and its DEPENDS are available during
> compilation.
>
> It may be acceptable to clone to the work-shared path, and then symlink
> the specific directory into the WORKDIR. But we will need to remain
> vigilant so that work-shared path is never referenced in the recipe.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#12528): https://lists.yoctoproject.org/g/meta-ti/mess=
age/12528
> Mute This Topic: https://lists.yoctoproject.org/mt/61321552/3619770
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [j-stiffler@=
ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000b32ea059830b619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Ideally I agree it=E2=80=99s best to have per compon=
ent git repos</div></div><div dir=3D"auto">But traditional SDKs have been m=
onolithic=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Nov 25, 2019 at 10:50 AM Jacob Stiffler &lt;<a =
href=3D"mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"></div><div text=3D"#000000" bgc=
olor=3D"#FFFFFF">
    <p><br>
    </p>
    <div>On 11/25/2019 1:16 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <a href=3D"mailt=
o:j-stiffler@ti.com" target=3D"_blank">&lt;j-stiffler@ti.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
</pre>
        <blockquote type=3D"cite">
          <pre>On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
</pre>
          <blockquote type=3D"cite">
            <pre>On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
</pre>
            <blockquote type=3D"cite">
              <pre>Recently individual components and LLD sources have been=
 combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Signed-off-by: Jacob Stiffler <a href=3D"mailto:j-stiffler@ti.com" target=
=3D"_blank">&lt;j-stiffler@ti.com&gt;</a>
---
</pre>
            </blockquote>
          </blockquote>
          <pre>...
</pre>
          <blockquote type=3D"cite">
            <blockquote type=3D"cite">
              <pre>+# Extract only required sources from PDK
+python do_unpack_append() {
+    if len(d.getVar(&#39;TI_PDK_COMP&#39;) or &#39;&#39;) &gt; 0:
+        import subprocess
+
+        src =3D
os.path.join(d.getVar(&#39;TI_PDK_SRC&#39;),&#39;packages&#39;,d.getVar(&#3=
9;TI_PDK_COMP_
PATH&#39;))
+
+        # Package up only the required sources
+        cmd =3D &#39;tar -cf - -C %s -p -S . | tar -xf - -C %s&#39; % (src=
,
d.getVar(&#39;S&#39;))
+        subprocess.check_output(cmd, shell=3DTrue,
stderr=3Dsubprocess.STDOUT)
+
+        bb.utils.remove(d.getVar(&#39;TI_PDK_SRC&#39;), recurse=3DTrue)
+}
</pre>
            </blockquote>
            <pre>perhaps looking in work-shared idea from kernel or gcc or =
clang
packages could make it better where, you only untar sources once
</pre>
          </blockquote>
          <pre>Jake,

Any updates on this - will you be looking into the above suggestion?
</pre>
        </blockquote>
        <pre>I had originally considered this approach, but decided against=
 it so
that there would be no way a recipe could access other sources in the
pdk.git.

It may be a bit paranoid, but the work-shared approach would make the
entire pdk sources available through a ti-pdk-fetch variable. I wanted
it so that the entire pdk.git will never be unpacked in its entirety.
</pre>
      </blockquote>
      <pre>disk operations are not cheap, so you could save a lot by
having a monorepo. Is it due to access perms ? then its a single
tarballs you cant have ACLs. I am still not convinced if monorepo
approach has downsides, plus its a known approach elsewhere so
will be easy on users.
</pre>
    </blockquote>
    </div><div text=3D"#000000" bgcolor=3D"#FFFFFF"><p>We wanted to have th=
is safety net to make sure that this pdk.git
      does not end up as spaghetti code. So this method was devised to
      ensure that only a single component&#39;s sources and its DEPENDS are
      available during compilation. <br>
    </p>
    <p>It may be acceptable to clone to the work-shared path, and then
      symlink the specific directory into the WORKDIR. But we will need
      to remain vigilant so that work-shared path is never referenced in
      the recipe.<br>
    </p>
    <blockquote type=3D"cite">
      <pre></pre>
      <blockquote type=3D"cite">
        <pre></pre>
        <br>
        <fieldset></fieldset>
        <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.

View/Reply Online (#12528): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/12528" target=3D"_blank">https://lists.yoctoproject.org/g/meta=
-ti/message/12528</a>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/61321552/3619=
770" target=3D"_blank">https://lists.yoctoproject.org/mt/61321552/3619770</=
a>
Group Owner: <a href=3D"mailto:meta-ti+owner@lists.yoctoproject.org" target=
=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" tar=
get=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/unsub</a>  [<a href=
=3D"mailto:j-stiffler@ti.com" target=3D"_blank">j-stiffler@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
</pre>
      </blockquote>
    </blockquote>
  </div>

</blockquote></div></div>

--0000000000000b32ea059830b619--
