Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.165.1616083666445370530
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 09:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mry2kU2x;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id b184so3804671pfa.11
        for <meta-ti@lists.yoctoproject.org>; Thu, 18 Mar 2021 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aIg2czgBZIm/t05sWbHG987pQ/x7mrbdZRZT6agv0AI=;
        b=mry2kU2xXMcgWbvCj0wxGC6llBBCVEiTf18zwFVaWQu/H/XmVixSJnSBHG6h1G6+pf
         W/IY1/p5x43TuOMPXecfkS9+DyMN81J9hJTPcyoLfEfe/6v9K2B/E3sq9ChPUpZkH0RF
         TuXYqQvvuNNw3eJfDdB+7z0DDnNEBtLq8HaShpjJUfbNuqK0pcFzR4hAGu6skD4IH/Xw
         yg7H3fUTzpYuYef4OuvLR0IiWGH4dgIPvtVnRtmRYSVUpDrCHZMTEI9QhdbKScjY2N53
         oxKJ6TqWBJ5YqAPY/Voe9wYrApOQsqlx7+xJabQabRdGB3rF1PjWmJ0+94UrxklF4RxO
         5JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aIg2czgBZIm/t05sWbHG987pQ/x7mrbdZRZT6agv0AI=;
        b=ghCsA3sojH5+oudmo/gzl8WZWYxh8axQZOzNSKWTENRbyHV2Tic0dG+qHTf1TfeZjR
         x8w3dM0WpPot/+K984LdEf4DPY/2WRn9WnQdEs/L8geYiNqwql7oTllTkcqe7PFebBFi
         5rM7n1O9aRt3GvISBF5NH01Ds6/T6G5KbgpDY95QrgGhl/HLz6xRZKeV6ns6/z7XyqC1
         IUy0/2MDiSwJMIwO3rXK2dEm8AR4ZGFLlAG/Jf59XfjMn2Dt+prZC2i80WAFOzx6Cndi
         /AYxXREq5dzOu5wEppcwIhJik3ISvkdq04l+6UjV/u8jHJWDghkBY4CLkjLLux40AG5q
         wrFA==
X-Gm-Message-State: AOAM533ooxTrxTeFILXN0DSPZPkh7sU4ayBgjJw6hclDzpKnu9i3p2rV
	m04Y+AVsDeu45pslhcwcLvw=
X-Google-Smtp-Source: ABdhPJxbXUrlMV0+yLNDgAmD2pka74uYo5ydrEAOzG6rE5hh1E+WiR85timQSdNpGYLfsdFoXeUx9w==
X-Received: by 2002:a65:4887:: with SMTP id n7mr7555168pgs.14.1616083665443;
        Thu, 18 Mar 2021 09:07:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.localdomain ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id 4sm2630347pgh.71.2021.03.18.09.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 09:07:44 -0700 (PDT)
Date: Thu, 18 Mar 2021 09:07:43 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: doxygen recipe duplicate in meta-ti
Message-ID: <20210318160743.2uwesxr4rjgl3efl@apollo.localdomain>
References: <CAMKF1som3yQ-6B7yzvdv-hHCyJF9h1VxnUoY0oTLpLfMdjYuKg@mail.gmail.com>
 <20210318070847.GV18041@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210318070847.GV18041@denix.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2021 at 03:08:47AM -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 17, 2021 at 10:55:30PM -0700, Khem Raj wrote:
> > Hi
> > 
> > I am seeing this
> > 
> > doxygen:
> >   meta-oe              1.8.20
> >   meta-ti              1.8.9.1
> > 
> > And meta-ti wins because it has higher layer priority, which is not a good thing
> > can we use the version from meta-oe and delete it from meta-ti ?
> 
> I would hate meta-ti to depend on meta-oe, which is rather backwards. I with 
> doxygen was part of oe-core...
> 
> On the other hand, usage of doxygen in meta-ti is not that critical and may 
> get reduced even further soon.

sure, I think it would be good to have it in OE-core, would you mind proposing it for oe-core ?

> 
> -- 
> Denys
